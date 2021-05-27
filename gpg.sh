#!/bin/bash

KEYS_PATH="$1"

if ! test -d "$KEYS_PATH"
then
  echo "Please add your keys path to this command's argument"
  exit 1
fi

KEYS_FILENAME="$KEYS_PATH/keys.txt"

if ! test -f "$KEYS_FILENAME"
then
  echo "Please double check whether your keys are present in the informed path"
  exit 1
fi

CYAN='\033[0;36m'
NC='\033[0m'

# log helper
log () {
  printf "${CYAN}$1${NC}\n"
}

while read line; do
  file=`echo $line | cut -d' ' -f 1`
  email=`echo $line | cut -d' ' -f 2`
  path="$KEYS_PATH/$file"

  if ! gpg --list-keys | grep $email > /dev/null
  then
    log "=> Importing key for $email"
    gpg --import "$path"
    gpg --edit-key $email trust quit
  else
    log "=> Key already imported for $email"
  fi
  
  # assign default key on git
  if echo "$line" | grep -o '*' > /dev/null
  then
    hash=`gpg --list-secret-keys --keyid-format LONG | grep -A1 $email | grep -Eo 'rsa\d+\/(\w+)' | cut -d'/' -f 2`
    git config --global commit.gpgsign true
    git config --global user.signingkey $hash
    log "=> Git will commit with the key $hash and email $email"
  fi
done < "$KEYS_FILENAME"

log "=> Double check your keys below"
gpg --list-secret-keys --keyid-format LONG
