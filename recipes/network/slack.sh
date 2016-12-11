. common/utils.sh

if should_install 'slack' 'Slack'; then
  wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.3.3-amd64.deb -O slack.deb >> /dev/null 2>&1
  sudo dpkg -i slack.deb >> /dev/null 2>&1
  rm slack.deb >> /dev/null 2>&1
fi
