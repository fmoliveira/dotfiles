function l1l
    set target_path "$argv[1]"
    if test -z "$target_path"
        set target_path $PWD
    end
    set search_path $(readlink -f "$target_path")
    set display_path $(echo "$search_path" | sed "s|$HOME|~|")
    echo "[$display_path]"
    find -s "$search_path" -type f -maxdepth 1 -execdir echo {} \;
    find -s "$search_path" -type l -maxdepth 1 | xargs -I# sh -c 'printf "%s = %s\n" $(basename #) $(readlink -f # | sed "s|$HOME|~|")'
end
