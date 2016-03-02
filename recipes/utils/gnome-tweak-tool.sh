. common/utils.sh

if should_install 'gnome-tweak-tool' 'Gnome Tweak Tool'; then
  sudo apt-get install -y gnome-tweak-tool
fi
