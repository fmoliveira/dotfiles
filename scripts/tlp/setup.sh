#!/bin/sh

# http://www.webupd8.org/2013/04/improve-power-usage-battery-life-in.html

sudo add-apt-repository -y ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw

sudo tlp start

sudo apt-get install -y smartmontools ethtool

sudo apt-get install -y tp-smapi-dkms acpi-call-tools

