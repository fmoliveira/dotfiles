# tmux shortcut to reattach or create new session
alias tm="tmux attach -d || tmux"

# enhance daily chores with sweeter looks
alias cat="bat"
alias cd="z"
alias ls="eza"
alias la="ls -lah"
alias lah="la"
alias man="batman"

# frequently used mouthful utilities
alias duh="du -h -d 1 | sort -nr"
abbr -a -- lg lazygit
abbr -a -- rcp 'rsync -avh --progress'
abbr -a -- rdu 'rsync -avz -n --stats'
abbr -a -- lar 'rsync --list-only'
