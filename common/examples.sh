. common/header.sh

# Log messages
info 'Info'
success 'Success'
warn 'Warning'
error 'Error'

# Section title
section 'DEVELOPMENT'

# Should install zsh?
if should_install 'zsh'; then
  trace 'Go to install zsh'
fi

# Should install Sublime?
if should_install 'subl'; then
  trace 'Go to install Sublime'
fi

# Should install photoshop?
section 'GRAPHICS'

if should_install 'photoshop'; then
  trace 'Go to install photoshop'
fi

blank