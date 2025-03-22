# tmux shortcut to reattach or create new session
alias tm="tmux attach -d || tmux"

# enhance daily chores with sweeter looks
if command -q eza
    alias ls="eza"
end

if command -q bat
    alias cat="bat"
end

if command -q bat; and command -q batman
    alias man="batman"
end

# concise defaults used daily
alias la="ls -lah"
alias lah="la"
alias duh="du -h -d 1 | sort -nr"

# frequently used mouthful utilities
abbr -a -- lg lazygit
abbr -a -- rcp 'rsync -avh --progress'
abbr -a -- rdu 'rsync -avz -n --stats'
abbr -a -- lar 'rsync --list-only'
