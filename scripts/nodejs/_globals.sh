#!/bin/sh

install_global () {
  module=$1
  executable=$1

  if [ "$2" != "" ]; then
    executable=$2
  fi

  which $executable >> /dev/null 2>&1

  if [ "$?" != 0 ]; then
    echo "Installing $module..."
    npm install -g $module
  else
    echo "$module is already installed."
  fi
}

install_global 'electron-prebuilt' 'electron'
install_global 'http-server'
install_global 'mocha'
install_global 'node-gi' 'gi'
install_global 'nodemon'
