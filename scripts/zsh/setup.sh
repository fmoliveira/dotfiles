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

  echo "Please logout and login back to use your new default shell and run this script again."
  return
else
  echo "Zsh is already your default shell."
fi

# Install oh-my-zsh
if [ ! -f "$HOME/.oh-my-zsh" ]; then
  echo "Oh-my-zsh is already installed."
else
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
