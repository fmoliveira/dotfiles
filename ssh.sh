#!/bin/bash

CYAN='\033[0;36m'
NC='\033[0m'

# log helper
log () {
  printf "${CYAN}$1${NC}\n"
}

if ! test -f ~/.ssh/id_rsa
then
  log "=> Creating SSH key"
  ssh-keygen -f ~/.ssh/id_rsa
else
  log "=> SSH key already exists"
fi

cat ~/.ssh/id_rsa.pub | pbcopy
log "=> Public key copied to clipboard!"

open "https://github.com/settings/keys"
