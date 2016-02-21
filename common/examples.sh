. common/header.sh

# Log messages
info 'Info'
success 'Success'
warn 'Warning'
error 'Error'

blank

# Should install zsh?
if should_install 'zsh'; then
  trace 'Go to install zsh'
fi

# Should install photoshop?
if should_install 'photoshop'; then
  trace 'Go to install photoshop'
fi

blank