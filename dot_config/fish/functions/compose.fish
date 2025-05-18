function compose
    set compose_name $argv[1]

    if test -z "$compose_name"
        echo "Compose file missing."
        return 1
    end

    if test -z "$argv[2]"
        echo "Compose command missing"
        return 1
    end

    set compose_filename $(find -s * -type f -name "$compose_name.compose.yml" -maxdepth 2 | tail -n 1)

    if test -z "$compose_filename"
        echo "No compose file matched."
        return 1
    end

    if test -f "op.env"
        echo "op run --env-file=\"op.env\""
        set op_filename "op.env"
    end

    echo "docker compose -f $compose_filename $argv[2..-1]"

    if test -z "$op_filename"
        docker compose -f "$compose_filename" $argv[2..-1]
    else
        if test "$argv[2]" = config
            op run --no-masking --env-file="op.env" -- docker compose -f "$compose_filename" config | bat
        else
            op run --env-file="op.env" -- docker compose -f "$compose_filename" $argv[2..-1]
        end
    end
end
