. common/utils.sh

if should_install 'g++' 'Build Essentials'; then
  sudo apt-get install -y build-essential >> /dev/null 2>&1
fi
