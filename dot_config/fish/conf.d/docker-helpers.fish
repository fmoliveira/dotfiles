alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' | sed -E 's/0.0.0.0|\[?::\]?:[0-9]+->[0-9]+\/tcp//g' | sed 's/, ,/,/g'"
alias dvl="docker volume ls --format '{{ .Name }}' | xargs -I% docker inspect % --format json | jq -c '.[] | { Name, CreatedAt }'"
