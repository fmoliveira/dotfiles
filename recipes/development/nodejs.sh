. common/utils.sh

if should_install 'node' 'Node.js'; then
  curl -L http://git.io/n-install | bash
  zsh $HOME/.zshrc
fi
