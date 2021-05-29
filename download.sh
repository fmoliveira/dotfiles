#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m'

# log helper
log () {
  printf "${CYAN}$1${NC}\n"
}

######### app images that can be automatically copied to the /Applications directory

# chrome
if ! test -d "/Applications/Google Chrome.app"
then
  log "=> Installing Google Chrome"
  rm -rf chrome.dmg
  curl "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" --output chrome.dmg
  open chrome.dmg
  cp -r "/Volumes/Google Chrome/Google Chrome.app" /Applications/
  umount "/Volumes/Google Chrome"
  rm -rf chrome.dmg
else
  log "=> Google Chrome is already installed"
fi

if ! test -d "/Applications/Discord.app"
then
  log "=> Installing Discord"
  rm -rf discord.dmg
  curl "https://discord.com/api/download?platform=osx" --output discord.dmg
  open discord.dmg
  cp -r "/Volumes/Discord/Discord.app" /Applications/
  umount "/Volumes/Discord"
  rm -rf discord.dmg
else
  log "=> Discord already installed"
fi

if ! test -d "/Applications/Obsidian.app"
then
  log "=> Installing Obsidian"
  rm -rf obsidian.dmg
  OBSIDIAN_LINK=`curl -s https://obsidian.md/ | grep -Eo "https://github.com/obsidianmd/obsidian-releases/releases/download/.*/Obsidian-.*.dmg" | head -n 1`
  curl $OBSIDIAN_LINK -F --output obsidian.dmg
  open obsidian.dmg
  cp -r "/Volumes/Obsidian*/Obsidian.app" /Applications/
  umount "/Volumes/Obsidian*"
  rm -rf obsidian.dmg
else
  log "=> Obsidian is already installed"
fi

if ! test -d "/Applications/Notion.app"
then
  log "=> Installing Notion"
  rm -rf notion.dmg
  curl "https://www.notion.so/desktop/mac/download" -L --output notion.dmg
  open notion.dmg
  cp -r "/Volumes/Notion Installer/Notion.app" /Applications/
  umount "/Volumes/Notion Installer"
  rm -rf notion.dmg
else
  log "=> Notion already installed"
fi

if ! test -d "/Applications/Spotify.app"
then
  log "=> Installing Spotify"
  rm -rf "Install Spotify.app"
  rm -rf spotify.zip
  curl "https://download.scdn.co/SpotifyInstaller.zip" --output spotify.zip
  unzip spotify.zip
  rm -rf spotify.zip
  open "Install Spotify.app"
  rm -rf "Install Spotify.app"
else
  log "=> Spotify already installed"
fi

######### app installers that need supervision

if ! test -d "/Applications/Google Drive.app"
then
  log "=> Installing Google Drive"
  rm -rf gdrive.dmg
  curl "https://dl.google.com/drive-file-stream/GoogleDrive.dmg" --output gdrive.dmg
  open gdrive.dmg
  open "/Volumes/Install Google Drive/GoogleDrive.pkg"
  umount "/Volumes/Install Google Drive"
  rm -rf gdrive.dmg
else
  log "=> Google Drive is already installed"
fi

# zoom
if ! test -d "/Applications/zoom.us.app"
then
  log "=> Installing Zoom"
  rm -rf zoom.pkg
  curl "https://www.zoom.us/client/latest/Zoom.pkg" --output zoom.pkg
  open zoom.pkg
  rm -rf zoom.pkg
else
  log "=> Zoom is already installed"
fi

######### double check to clean up all installers
rm -rf *.app
rm -rf *.dmg
rm -rf *.pkg
rm -rf *.zip
