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
  curl "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" -L --output chrome.dmg
  hdiutil attach -quiet -nobrowse chrome.dmg
  cp -r "/Volumes/Google Chrome/Google Chrome.app" /Applications/
  umount "/Volumes/Google Chrome"
  rm -rf chrome.dmg
else
  log "=> Google Chrome is already installed"
fi

# anki
if ! test -d "/Applications/Anki.app"
then
  log "=> Installing Anki"
  rm -rf anki.dmg
  ANKI_LINK=`curl -s "https://apps.ankiweb.net/" | grep -o "https://.*.dmg" | head -n 1`
  curl $ANKI_LINK -L --output anki.dmg
  hdiutil attach -quiet -nobrowse anki.dmg
  cp -r "/Volumes/Anki/Anki.app" /Applications/
  umount "/Volumes/Anki"
  rm -rf anki.dmg
else
  log "=> Anki is already installed"
fi

if ! test -d "/Applications/Discord.app"
then
  log "=> Installing Discord"
  rm -rf discord.dmg
  curl "https://discord.com/api/download?platform=osx" -L --output discord.dmg
  hdiutil attach -quiet -nobrowse discord.dmg
  cp -r "/Volumes/Discord/Discord.app" /Applications/
  umount "/Volumes/Discord"
  rm -rf discord.dmg
else
  log "=> Discord is already installed"
fi

if ! test -d "/Applications/Obsidian.app"
then
  log "=> Installing Obsidian"
  rm -rf obsidian.dmg
  OBSIDIAN_LINK=`curl -s https://obsidian.md/ | grep -Eo "https://github.com/obsidianmd/obsidian-releases/releases/download/.*/Obsidian-.*.dmg" | head -n 1`
  curl $OBSIDIAN_LINK -L --output obsidian.dmg
  hdiutil attach -quiet -nobrowse obsidian.dmg
  OBSIDIAN_VOLUME=`ls /Volumes | grep -e '^Obsidian' | head -n 1`
  cp -r "/Volumes/$OBSIDIAN_VOLUME/Obsidian.app" /Applications/
  umount "/Volumes/$OBSIDIAN_VOLUME"
  rm -rf obsidian.dmg
else
  log "=> Obsidian is already installed"
fi

if ! test -d "/Applications/Notion.app"
then
  log "=> Installing Notion"
  rm -rf notion.dmg
  curl "https://www.notion.so/desktop/mac/download" -L --output notion.dmg
  hdiutil attach -quiet -nobrowse notion.dmg
  cp -r "/Volumes/Notion Installer/Notion.app" /Applications/
  umount "/Volumes/Notion Installer"
  rm -rf notion.dmg
else
  log "=> Notion is already installed"
fi

if ! test -d "/Applications/Miro.app"
then
  log "=> Installing Miro"
  rm -rf miro.dmg
  curl "https://desktop.miro.com/platforms/darwin/Miro.dmg" -L --output miro.dmg
  hdiutil attach -quiet -nobrowse miro.dmg
  cp -r "/Volumes/Miro/Miro.app" /Applications/
  umount "/Volumes/Miro"
  rm -rf miro.dmg
else
  log "=> Miro is already installed"
fi

if ! test -d "/Applications/Figma.app"
then
  log "=> Installing Figma"
  rm -rf figma.zip
  curl "https://www.figma.com/download/desktop/mac" -L --output figma.zip
  unzip -q figma.zip
  rm -rf figma.zip
  mv "Figma.app" /Applications/
  rm -rf "__MACOSX"
else
  log "=> Figma is already installed"
fi

if ! test -d "/Applications/Spotify.app"
then
  log "=> Installing Spotify"
  rm -rf "Install Spotify.app"
  rm -rf spotify.zip
  curl "https://download.scdn.co/SpotifyInstaller.zip" -L --output spotify.zip
  unzip -q spotify.zip
  rm -rf spotify.zip
  open "Install Spotify.app"
  while ! test -d "/Applications/Spotify.app"
  do
    sleep 1
  done
  rm -rf "Install Spotify.app"
else
  log "=> Spotify is already installed"
fi

if ! test -d "/Applications/GitHub Desktop.app"
then
  log "=> Installing GitHub Desktop"
  rm -rf "GitHub Desktop.app"
  rm -rf github.zip
  curl "https://central.github.com/deployments/desktop/desktop/latest/darwin" -L --output github.zip
  unzip -q github.zip
  rm -rf github.zip
  mv "GitHub Desktop.app" /Applications/
else
  log "=> GitHub Desktop is already installed"
fi

if ! test -d "/Applications/Docker.app"
then
  log "=> Installing Docker"
  rm -rf docker.dmg
  curl "https://desktop.docker.com/mac/stable/amd64/Docker.dmg" -L --output docker.dmg
  hdiutil attach -quiet -nobrowse docker.dmg
  cp -R "/Volumes/Docker/Docker.app" /Applications/
  umount "/Volumes/Docker"
  rm -rf docker.dmg
else
  log "=> Docker is already installed"
fi

######### app installers that need supervision

if ! test -d "/Applications/Google Drive.app"
then
  log "=> Installing Google Drive"
  rm -rf gdrive.dmg
  curl "https://dl.google.com/drive-file-stream/GoogleDrive.dmg" -L --output gdrive.dmg
  hdiutil attach -quiet -nobrowse gdrive.dmg
  open "/Volumes/Install Google Drive/GoogleDrive.pkg"
  while ! test -d "/Applications/Google Drive.app"
  do
    sleep 1
  done
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
  curl "https://www.zoom.us/client/latest/Zoom.pkg" -L --output zoom.pkg
  open zoom.pkg
  while ! test -d "/Applications/zoom.us.app"
  do
    sleep 1
  done
  rm -rf zoom.pkg
else
  log "=> Zoom is already installed"
fi

if ! test -f "/usr/local/share/dotnet/dotnet"
then
  log "=> Installing .NET Core SDK"
  rm -rf dotnetcore.pkg
  NETCORE_PAGE=`curl -s "https://dotnet.microsoft.com/download" | grep "macos-x64-installer" | grep ".NET Core SDK" | grep -o "/download/.*macos-x64-installer"`
  NETCORE_LINK=`curl -s "https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-3.1.409-macos-x64-installer" | grep "https://download.visualstudio.microsoft.com/.*dotnet-sdk-.*.pkg" | grep "click here to download" | grep -o "https://.*.pkg"`
  curl $NETCORE_LINK -L --output dotnetcore.pkg
  open dotnetcore.pkg
  while ! test -d "/usr/local/share/dotnet/dotnet"
  do
    sleep 1
  done
  rm -rf dotnetcore.pkg
else
  log "=> .NET Core SDK is already installed"
fi

######### double check to clean up all installers
rm -rf *.app
rm -rf *.dmg
rm -rf *.pkg
rm -rf *.zip
