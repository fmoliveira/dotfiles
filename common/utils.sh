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
  display_name=$1

  if [ "$2" != "" ]; then
    display_name=$2
  fi

  if is_installed $1; then
    success "$display_name is already installed."
    return 1
  else
    info "Installing $display_name..."
    return 0
  fi
}