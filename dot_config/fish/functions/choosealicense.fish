function choosealicense --description "Choose a license using the GitHub API and retrieve the license text file."
    set -l license_name $argv[1]

    if test -z "$license_name"
        echo 'Usage: "choosealicense <license_name>". Press TAB for completions.'
        return 1
    end

    curl -sS https://api.github.com/licenses/$license_name | jq -r '.body' > LICENSE
end

