. common/utils.sh

if should_install 'heroku' 'Heroku'; then
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi
