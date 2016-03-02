. common/utils.sh

if should_install 'redshift' 'Redshift'; then
  sudo apt-get install -y redshift redshift-gtk >> /dev/null 2>&1
fi
