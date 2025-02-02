function viconf --description "Edit fish config files and automatically handle chezmoi apply and sourcing."
    set -l target_file $argv[1]

    if test -z "$target_file"
        set target_file "config.fish"
    end

    if not test -f "$HOME/.config/fish/$target_file"
        touch "$HOME/.config/fish/$target_file"
        chezmoi add "$HOME/.config/fish/$target_file"
    end

    chezmoi edit "$HOME/.config/fish/$target_file" --apply
    source "$HOME/.config/fish/config.fish"
end

