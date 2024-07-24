#!/bin/bash
# Loui JSON file
VERSION_FILE="./updateScript/loui.json"

# Reed the actual version of the file
CURRENT_VERSION=$(jq -r '.name' $VERSION_FILE)

# Increment the version
# The version is in the format X.Y.Z and increments Z
OLD_Z=$(echo $CURRENT_VERSION | cut -d '.' -f 3)
NEW_Z=$((OLD_Z + 1))
NEW_VERSION=$(echo $CURRENT_VERSION | sed "s/\.[0-9]*$/.$NEW_Z/")

# Update the version in the JSON file
jq --arg new_version "$NEW_VERSION" '.name = $new_version' $VERSION_FILE > temp.json && mv temp.json $VERSION_FILE

# Print the new version
echo "Version updated to: $NEW_VERSION"