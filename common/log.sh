# Code | Color
# ==== + ========
#   00 | No color
#   30 | Black
#   31 | Red
#   32 | Green
#   33 | Yellow
#   34 | Blue
#   35 | Magenta
#   36 | Cyan
#   37 | White

_log () {
  echo "\033[1;$1m $2\033[0m"
}

info () {
  _log 34 "=> $1"
}

success () {
  _log 32 " $ $1"
}

warning () {
  _log 33 " ! $1"
}

error () {
  _log 31 " x $1"
}

info 'Info'
success 'Success'
warning 'Warning'
error 'Error'