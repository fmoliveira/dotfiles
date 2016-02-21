. common/colors.sh

# Log a colored message to stdout
# log $COLOR_BLUE 'Log something cool'
log () {
  echo "\033[1;$1m $2\033[0m"
}

# Prints a blank line
# blank
blank () {
  echo ' '
}

# Prints a trace level log
# trace 'Log some trace message'
trace () {
  log $COLOR_DEFAULT "   $1"
}

# Prints a info level log
# info 'Log some info message'
info () {
  log $COLOR_BLUE "=> $1"
}

# Prints a success level log
# success 'Log some success message'
success () {
  log $COLOR_GREEN " $ $1"
}

# Prints a warning level log
# warn 'Log some warning message'
warn () {
  log $COLOR_YELLOW " ! $1"
}

# Prints an error level log
# warn 'Log some error message'
error () {
  log $COLOR_RED " x $1"
}