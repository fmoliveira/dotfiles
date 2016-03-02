#!/bin/sh

# Load headers
. common/header.sh

# Update repository
git pull >> /dev/null 2>&1

# Run all recipes
for dir in "recipes/"*
do
  title=`basename "$dir" | tr '[:lower:]' '[:upper:]'`
  section $title
  . $dir/*
done

# Final padding
blank
