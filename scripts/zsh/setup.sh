#!/bin/sh

# Install zsh if it isn't
which zsh >> /dev/null

if [ "$?" == "0" ]; then
  echo "Zsh already installed."
else
  echo "Installing Zsh..."
  sudo apt-get install zsh
fi

# Set it as default shell if it isn't
if [ "$SHELL" != `which zsh` ]; then
  echo "Setting Zsh as default shell..."
  chsh -s `which zsh`

  echo "Please logout and login back to use your new default shell."
else
  echo "Zsh is already your default shell."
fi
