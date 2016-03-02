#!/bin/sh

# Load headers
. common/header.sh

# Update repository
git pull >> /dev/null 2>&1

# Iterate all sections
for dir in "recipes/"*
do
  title=`basename "$dir" | tr '[:lower:]' '[:upper:]'`
  section $title

  # Run all recipes
  for file in "$dir/"*
  do
    . $file
  done
done

# Final padding
blank
