#!/bin/bash

######### app images that can be automatically copied to the /Applications directory

# chrome
if ! test -d "/Applications/Google Chrome.app"
then
  rm -rf chrome.dmg
  curl "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" --output chrome.dmg
  open chrome.dmg
  cp -r "/Volumes/Google Chrome/Google Chrome.app" /Applications/
  umount "/Volumes/Google Chrome"
  rm -rf chrome.dmg
fi
