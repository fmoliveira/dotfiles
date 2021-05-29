#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m'

# log helper
log () {
  printf "${CYAN}$1${NC}\n"
}

FILENAME="./data/app-store.txt"
BASE_PATH="/Applications"
BASE_URL="itms-apps://apps.apple.com/us/app"

while read line; do
  # id is the numerical id from app store urls
  id=`echo $line | cut -d',' -f 1`

  # app is the actual folder name in the /Applications folder
  app=`echo $line | cut -d',' -f 2`

  # build the path and url to check for app installation and open app store
  path="$BASE_PATH/$app.app"
  url="$BASE_URL/id$id"

  # check if the app is still not installed
  if ! test -d "$path"
  then
    log "=> Installing $app..."
    open "$url"

    # wait for installation to finish
    while ! test -d "$path"
    do
      sleep 1
    done
  else
    log "=> $app is already installed"
  fi

done < $FILENAME

# use command line tools from installed xcode version
# OHNO: this asks for user password so it's annoying to always run it
# TODO: figure how to validate whether it's necessary to run this command, probably with the output of `xcodebuild`
# HELP: https://stackoverflow.com/questions/17980759/xcode-select-active-developer-directory-error/17980786#17980786
sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
