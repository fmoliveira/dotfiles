set -a PATH $HOME/bin
set -a PATH $HOME/.local/bin

set -x GOPATH $HOME/go
set -a PATH $GOPATH/bin
set -a PATH $HOME/local/share/go/bin # GOROOT

set -gx EDITOR nvim
set fish_greeting
