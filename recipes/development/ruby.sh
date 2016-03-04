. common/utils.sh

if should_install 'rbenv' 'RB Env'; then
  sudo apt-get update >> /dev/null 2>&1
  sudo apt-get install -y zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev >> /dev/null 2>&1

  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv >> /dev/null 2>&1
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc

  echo 'Please restart your Shell and run this script again.'
  exit 1
fi

if should_install 'ruby-build' 'Ruby Build'; then
  git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build >> /dev/null 2>&1
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.zshrc
fi

if should_install 'ruby' 'Ruby'; then
  rbenv install -v 2.3.0
  rbenv global 2.3.0
  echo "gem: --no-document" > ~/.gemrc
fi
