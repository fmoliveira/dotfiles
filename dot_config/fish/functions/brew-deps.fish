# usage: brew-deps > Brewfile-deps
# this produces 3 different files: Brewfile, Brewfile-digraph, and Brewfile-deps
# don't ask me why it needs redirection for the latter, I won't remember what I was thinking.
# just trying to tidy up my brew installation and get rid of dependency-hungry packages.
# nowadays I'm trying to rely more on native setups with go install and cargo install,
# and really leaving homebrew as a last last resort (double "last" is intended).

function brew-deps
    set -l cellar_path $(brew --cellar)
    brew bundle dump --force --describe
    brew deps --graph --dot --installed >$HOME/Brewfile-digraph

    for line in (grep "^brew" $HOME/Brewfile | cut -d\" -f2)
        set -l formula_name $(echo "$line" | rev | cut -d/ -f1 | rev)
        set -l formula_size $(command du -h -d 0 $cellar_path/$formula_name | cut -d/ -f1 | xargs)
        echo "* $line: ($formula_size)"
        grep "\"$line\" ->" $HOME/Brewfile-digraph
        echo -
    end
end
