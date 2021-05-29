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

if ! test -d "/Applications/Discord.app"
then
  rm -rf discord.dmg
  curl "https://discord.com/api/download?platform=osx" --output discord.dmg
  open discord.dmg
  cp -r "/Volumes/Discord/Discord.app" /Applications/
  umount "/Volumes/Discord"
  rm -rf discord.dmg
fi

if ! test -d "/Applications/Obsidian.app"
then
  rm -rf obsidian.dmg
  OBSIDIAN_LINK=`curl -s https://obsidian.md/ | grep -Eo "https://github.com/obsidianmd/obsidian-releases/releases/download/.*/Obsidian-.*.dmg" | head -n 1`
  curl $OBSIDIAN_LINK -F --output obsidian.dmg
  open obsidian.dmg
  cp -r "/Volumes/Obsidian*/Obsidian.app" /Applications/
  umount "/Volumes/Obsidian*"
  rm -rf obsidian.dmg
fi

if ! test -d "/Applications/Spotify.app"
then
  rm -rf "Install Spotify.app"
  rm -rf spotify.zip
  curl "https://download.scdn.co/SpotifyInstaller.zip" --output spotify.zip
  unzip spotify.zip
  rm -rf spotify.zip
  open "Install Spotify.app"
  rm -rf "Install Spotify.app"
fi

######### app installers that need supervision

if ! test -d "/Applications/Google Drive.app"
then
  rm -rf gdrive.dmg
  curl "https://dl.google.com/drive-file-stream/GoogleDrive.dmg" --output gdrive.dmg
  open gdrive.dmg
  open "/Volumes/Install Google Drive/GoogleDrive.pkg"
  umount "/Volumes/Install Google Drive"
  rm -rf gdrive.dmg
fi

# zoom
if ! test -d "/Applications/zoom.up.app"
then
  rm -rf zoom.pkg
  curl "https://www.zoom.us/client/latest/Zoom.pkg" --output zoom.pkg
  open zoom.pkg
  rm -rf zoom.pkg
fi
