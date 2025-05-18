function hook --description "Hook shell to the specified remote docker host with ssh."
    set -l ssh_host $argv[1]

    if test -z "$ssh_host"
        echo 'Usage: "hook <ssh_host>".'
        return 1
    end

    fish --init-command="set -x DOCKER_HOST ssh://$ssh_host"
end
