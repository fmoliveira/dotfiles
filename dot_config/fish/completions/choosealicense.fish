complete -c choosealicense -f
complete -c choosealicense -a "(curl -sS https://api.github.com/licenses | jq -r '.[].key')"
