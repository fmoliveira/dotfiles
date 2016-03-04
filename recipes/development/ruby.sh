. common/utils.sh

if should_install 'rvm' 'RVM'; then
  gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 >> /dev/null 2>&1
  \curl -sSL https://get.rvm.io | bash -s stable >> /dev/null 2>&1
fi
