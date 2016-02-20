#!/bin/sh

which gnome-tweak-tool >> /dev/null
if [ "$?" == "0" ]; then
  echo "[INFO] Gnome Tweak Tool already installed."
else
  echo "[INFO] Installing Gnome Tweak Tool..."
  sudo apt-get install -y gnome-tweak-tool
fi