. common/log.sh

# Check whether an application is installed
# if is_installed 'zsh'; then
is_installed () {
  which $1 > /dev/null
  return $?
}

# Check whether should install an application
# if should_install 'zsh'; then
should_install () {
  if is_installed $1; then
    success "$1 is already installed."
    return 1
  else
    info "Installing $1..."
    return 0
  fi
}
