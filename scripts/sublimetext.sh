#!/bin/sh

which subl > /dev/null

if [ "$?" == 0 ]; then
  echo "Sublime Text already installed."
else
  rm -f sublime-text_*.deb

  echo "Downloading Sublime Text..."
  LINK=`curl https://www.sublimetext.com/3 | grep -E 'https.+amd64\.deb' --only-matching`
  FILENAME=`echo $LINK | grep -E 'sublime-text_.+\.deb' --only-matching`

  echo "Installing Sublime Text..."
  wget $LINK
  sudo dpkg -i $FILENAME
  rm $FILENAME
fi

