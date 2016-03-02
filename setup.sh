#!/bin/sh

# Load headers
. common/header.sh

# Update repository
git pull >> /dev/null 2>&1

# Media
section 'MEDIA'
. recipes/media/*

# Utils
section 'UTILS'
. recipes/utils/*

blank
