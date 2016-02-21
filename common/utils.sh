. common/log.sh

# Check whether an application is installed
# if is_installed 'zsh'; then
is_installed () {
  which $1 > /dev/null
  return $?
}
