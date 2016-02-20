#!/bin/sh

which n > /dev/null

if [ "$?" == 0 ]; then
  echo "N is already installed."
else
  echo "Installing N..."
  curl -L http://git.io/n-install | bash
fi

zsh $HOME/.zshrc

node -v
npm -v
