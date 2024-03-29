#!/bin/bash

DOTFILESHOME="/Volumes/GoogleDrive/My Drive/dotfiles"
CYAN='\033[0;36m'
NC='\033[0m'

# log helper
log () {
  printf "${CYAN}$1${NC}\n"
}

# homebrew
log "=> Installing Homebrew"
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# brew packages
log "=> Installing brew packages"
brew install git
brew install gh
brew install exercism
brew install gcc
brew install cmake
brew install golang
brew install postgresql
brew install mailhog
brew install youtube-dl
brew install responsively
brew install ffmpeg
brew install raycast
brew install meetingbar
brew tap mongodb/brew && brew install mongodb-community@5.0
brew install redis
brew install nginx
brew install rabbitmq && rabbitmq-plugins enable rabbitmq_management
brew install java && sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

# setup brew services
brew services start postgresql
brew services start mailhog
brew services start mongodb-community@5.0
brew services start redis
brew services start nginx
brew services start rabbitmq

# rust
if ! command -v rustup &> /dev/null
then
  log "=> Installing Rust"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  log "=> Updating Rust"
  rustup update &> /dev/null
fi

# nodejs (temporarily disabled)
# if ! command -v n &> /dev/null
# then
#   log "=> Installing Node.js"
#   curl -L https://git.io/n-install | bash
#   zsh ~/.zshrc
# else
#   log "=> Node.js is already installed"
# fi

# vs code
if ! test -d "/Applications/Visual Studio Code.app"
then
  log "=> Installing VS Code"
  rm -rf vscode.zip
  curl "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal" -L --output vscode.zip
  unzip -q vscode.zip
  mv "Visual Studio Code.app" /Applications/
  rm -rf vscode.zip
else
  log "=> VS Code is already installed"
fi

# add vs code to path
if ! test -f "/usr/local/bin/code"
then
  log "=> Adding VS Code to path"
  ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" "/usr/local/bin/code"
else
  log "=> VS Code is already in the path"
fi

# install vs code extensions
log "=> Installing VS Code extensions"
code --install-extension "shan.code-settings-sync" --force

# export terminal helpers from google drive
if test -d "/Volumes/GoogleDrive"
then
  cat ~/.zshrc | grep zsh_helpers > /dev/null
  if ! cat ~/.zshrc | grep zsh_helpers > /dev/null
  then
  log "=> Exporting terminal helpers"
    echo -e "\n# terminal helpers\nsource \"$DOTFILESHOME/zsh_helpers.sh\"\n" >> ~/.zshrc
    zsh ~/.zshrc
  else
    log "=> Terminal helpers are already exported"
  fi
else
  log "=> Missing Google Drive folder, unable to export terminal helpers"
fi

# gpg tools
if ! test -d "/Applications/GPG Keychain.app/"
then
  log "=> Installing GPG Tools"
  GPG_TOOLS_LINK=`curl -s https://gpgtools.org/ | grep -Eo "https://releases.gpgtools.org/GPG_Suite.*\.dmg" | head -n 1`
  curl $GPG_TOOLS_LINK --output gpgtools.dmg
  open gpgtools.dmg
  open "/Volumes/GPG Suite/Install.pkg" &
else
  log "=> GPG Tools is already installed, run \`./gpg.sh\` to configure"
fi

# setup default git branch name
git config --global init.defaultBranch

# configure exercism
EXERCISM_TOKEN=`cat "$DOTFILESHOME/env/exercism"`
mkdir -p ~/Repos/fmoliveira/exercism
exercism configure --token=$EXERCISM_TOKEN --workspace "~/Repos/fmoliveira/exercism/"

# list versions
log "=> Everything set up!"
git --version
gh --version | head -n 1
exercism version

printf "GCC version "
gcc --version | head -n 1

cmake --version | head -n 1
rustc --version
go version

NODE_VERSION=`node --version`
printf "Node version ${NODE_VERSION}\n"

CODE_VERSION=`code --version | head -n 1`
printf "VS Code version ${CODE_VERSION}\n"
