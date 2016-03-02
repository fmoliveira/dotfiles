. common/utils.sh

if should_install 'inkscape' 'Inkscape'; then
  sudo add-apt-repository -y ppa:inkscape.dev/stable >> /dev/null 2>&1
  sudo apt-get update >> /dev/null 2>&1
  sudo apt-get install -y inkscape >> /dev/null 2>&1
fi
