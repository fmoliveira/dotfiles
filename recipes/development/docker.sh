. common/utils.sh

if should_install 'docker' 'Docker'; then
  curl -sSL https://get.docker.com/ | sh
  sudo usermod -aG docker `whoami`
  info 'Please restart your X session for Docker permissions to apply.'
fi
