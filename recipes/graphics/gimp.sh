. common/utils.sh

if should_install 'gimp' 'GIMP'; then
  sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp >> /dev/null 2>&1
  sudo apt-get update >> /dev/null 2>&1
  sudo apt-get install -y gimp >> /dev/null 2>&1
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh)"
fi
