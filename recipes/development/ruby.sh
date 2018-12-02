. common/utils.sh

if should_install 'rbenv' 'rbenv'; then
  sudo apt-get update >> /dev/null 2>&1
  sudo apt-get install -y zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev >> /dev/null 2>&1

  git clone git://github.com/rbenv/rbenv.git ~/.rbenv >> /dev/null 2>&1
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc

  echo 'Please restart your Shell and run this script again.'
  exit 1
fi

if should_install 'ruby-build' 'Ruby Build'; then
  git clone git://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build >> /dev/null 2>&1
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc

  echo 'Please restart your Shell and run this script again.'
  exit 1
fi

if should_install 'ruby' 'Ruby'; then
  rbenv install -v 2.5.3
  rbenv global 2.5.3
  echo "gem: --no-document" > ~/.gemrc
fi

if should_install 'rails' 'Rails'; then
  gem install rails
  rbenv rehash
fi

if should_install 'jekyll' 'Jekyll'; then
  gem install jekyll
  rbenv rehash
fi
