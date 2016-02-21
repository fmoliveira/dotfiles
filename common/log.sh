# Color definitions
COLOR_DEFAULT=00
COLOR_BLACK=30
COLOR_RED=31
COLOR_GREEN=32
COLOR_YELLOW=33
COLOR_BLUE=34
COLOR_MAGENTA=35
COLOR_CYAN=36
COLOR_WHITE=37

log () {
  echo "\033[1;$1m $2\033[0m"
}

blank () {
  echo ' '
}

trace () {
  log $COLOR_DEFAULT "   $1"
}

info () {
  log $COLOR_BLUE "=> $1"
}

success () {
  log $COLOR_GREEN " $ $1"
}

warning () {
  log $COLOR_YELLOW " ! $1"
}

error () {
  log $COLOR_RED " x $1"
}

info 'Info'
success 'Success'
warning 'Warning'
error 'Error'