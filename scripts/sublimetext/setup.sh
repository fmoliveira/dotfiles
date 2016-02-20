#!/bin/sh

# Install Sublime Text if it isn't
which subl > /dev/null

if [ "$?" == 0 ]; then
  echo "Sublime Text already installed."
else
  rm -f sublime-text_*.deb

  echo "Downloading Sublime Text..."
  LINK=`curl https://www.sublimetext.com/3 | grep -E 'https.+amd64\.deb' --only-matching`
  FILENAME=`echo $LINK | grep -E 'sublime-text_.+\.deb' --only-matching`

  echo "Installing Sublime Text..."
  wget $LINK
  sudo dpkg -i $FILENAME
  rm $FILENAME
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

