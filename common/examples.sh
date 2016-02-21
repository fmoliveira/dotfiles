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
if should_install 'subl' 'Sublime Text'; then
  trace 'Go to install Sublime'
fi

# Section title
section 'GRAPHICS'

# Should install photoshop?
if should_install 'photoshop'; then
  trace 'Go to install photoshop'
  error 'Wine is not installed!'
fi

# Should install GIMP?
if should_install 'gimp' 'GIMP'; then
  trace 'Go to install gimp'
fi

# Section title
section 'MEDIA'

# Should install spotify?
if should_install 'spotify' 'Spotify'; then
  trace 'Go to install spotify'
fi

blank