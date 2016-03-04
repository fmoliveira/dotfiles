. common/utils.sh

if should_install 'rbenv' 'RB Env'; then
  sudo apt-get update >> /dev/null 2>&1
  sudo apt-get install -y zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev >> /dev/null 2>&1

  git clone git://github.com/sstephenson/rbenv.git ~/.rbenv >> /dev/null 2>&1
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
  echo 'eval "$(rbenv init -)"' >> ~/.zshrc
fi
