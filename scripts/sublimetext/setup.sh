#!/bin/sh

# Install Sublime Text if it isn't
which subl > /dev/null

if [ "$?" == 0 ]; then
  echo "Sublime Text already installed."
else
  echo " Installing Sublime Text..."
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list 
  sudo apt-get update
  sudo apt-get install sublime-text
fi

# Create config directory if it isn't
if [ ! -d "$HOME/.config/sublime-text-3" ]; then
  mkdir -p "$HOME/.config/sublime-text-3"
fi

# Create symlinks
echo "Creating symlinks..."

source_name="$HOME/.config/sublime-text-3/Installed Packages"
target_name="$HOME/repos/fmoliveira/dotfiles/scripts/sublimetext/Installed Packages"
if [ -d "$source_name" ] && [ ! -L "$source_name" ]; then
  mv "$source_name" "$source_name.old"
  mkdir -p "$target_name"
fi

if [ ! -L "$source_name" ]; then
  ln -s "$target_name" "$source_name"
fi

source_name="$HOME/.config/sublime-text-3/Packages"
target_name="$HOME/repos/fmoliveira/dotfiles/scripts/sublimetext/Packages"
if [ -d "$source_name" ] && [ ! -L "$source_name" ]; then
  mv "$source_name" "$source_name.old"
  mkdir -p "$target_name"
fi

if [ ! -L "$source_name" ]; then
  ln -s "$target_name" "$source_name"
fi

ls -l "$HOME/.config/sublime-text-3/"

