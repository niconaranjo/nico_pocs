#!/bin/bash

# Get first last update from the document
git fetch --depth=1 origin master
git checkout origin/master -- ./updateScript/loui.json


# Nombre del archivo JSON
VERSION_FILE="./updateScript/loui.json"

# Leer la versión actual desde el archivo JSON
CURRENT_VERSION=$(jq -r '.name' $VERSION_FILE)

# Loui JSON file

# Increment the version
# The version is in the format X.Y.Z and increments Z
OLD_VERSION=$CURRENT_VERSION
OLD_Z=$(echo $OLD_VERSION | cut -d '.' -f 3)
NEW_Z=$((OLD_Z + 1))
NEW_VERSION=$(echo $OLD_VERSION | sed "s/\.[0-9]*$/.$NEW_Z/")

# Update the version in the JSON file
jq --arg new_version "$NEW_VERSION" '.name = $new_version' $VERSION_FILE > temp.json && mv temp.json $VERSION_FILE

# Get last message from git
LAST_COMMIT_MSG=$(git log -1 --pretty=%B)

# Print the new version
echo "Version updated to: $NEW_VERSION"

# Stage the version change
git add $VERSION_FILE

# Amend the previous commit with the version update
git commit --amend -m "$LAST_COMMIT_MSG"