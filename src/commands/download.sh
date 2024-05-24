#!/usr/bin/env bash

# Run this to download all the available jars.

# All the NMS versions available
legacy_versions=(""
)

versions=(
  "spigot-1.20.4"
)

# Go back and create dir spigot_versions if not exists
cd ../../
mkdir spigot_versions/ -p
cd spigot_versions/ || exit 1

# Download all legacy versions from cdn.getbukkit.org on dir spigot_versions
for version in "${legacy_versions[@]}"; do
  echo -e "Downloading \e[34m$version\e[39m...\e[39m"
  if curl --fail https://cdn.getbukkit.org/spigot/"$version".jar --output "$version".jar; then
    echo -e "Downloaded \e[34m$version \e[39msuccessfully!"
  else
    # If the download fails stop the execution
    echo ""
    echo -e "\e[91mSomething went wrong!\e[39m"
    exit 1
  fi
  echo ""
done

# Download all versions from download.getbukkit.org on dir spigot_versions
for version in "${versions[@]}"; do
  echo -e "Downloading \e[34m$version\e[39m...\e[39m"
  if curl --fail https://download.getbukkit.org/spigot/"$version".jar --output "$version".jar; then
    echo -e "Downloaded \e[34m$version \e[39msuccessfully!"
  else
    # If the download fails stop the execution
    echo ""
    echo -e "\e[91mSomething went wrong!\e[39m"
    exit 1
  fi
  echo ""
done

echo -e "\e[32mSuccessfully downloaded all available versions!\e[39m"

# Go back to the commands folder
cd ../src/commands/ || exit 1
