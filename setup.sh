#!/bin/sh

# Load headers
. common/header.sh

# Update repository
git pull >> /dev/null 2>&1

# Media
section 'MEDIA'
. recipes/media/*

blank

exit 0

. scripts/sublimetext/setup.sh

# TO DO: protect script from running multiple times
#. scripts/spotify/setup.sh

. scripts/utils/setup.sh
