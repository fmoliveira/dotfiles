#!/bin/sh

which slack >> /dev/null
if [ "$?" == "0" ]; then
  echo "[INFO] Slack already installed."
else
  echo "[INFO] Installing Slack..."
  wget https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/slack-desktop-2.0.0-amd64.deb -O slack.deb
  sudo dpkg -i slack.deb
  rm slack.deb
fi
