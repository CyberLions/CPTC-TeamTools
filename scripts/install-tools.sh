#!/bin/bash

# 1. Check to confirm we are running as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root!"
  exit 1
fi

# 2. Install Sliver
echo "Installing Sliver..."
if ! curl -fsSL https://sliver.sh/install | bash; then
  echo "Error: Failed to install Sliver"
  exit 1
fi

# 3. Check if git is installed
if ! command -v git &> /dev/null; then
  echo "git could not be found. Installing git..."
  if ! apt-get update && apt-get install -y git; then
    echo "Error: Failed to install git"
    exit 1
  fi
fi

# 4. Clone SecLists repository
echo "Cloning SecLists repository..."
if ! git clone https://github.com/danielmiessler/SecLists.git; then
  echo "Error: Failed to clone SecLists"
  exit 1
fi

echo "Sliver installed and SecLists cloned successfully!"
