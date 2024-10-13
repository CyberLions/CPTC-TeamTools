# !/bin/bash

#1. Check to confirm we are running as root
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root!"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: $0 <IP_ADDRESS>"
  exit 1
fi

# Define usernames for the configs we're going to make
ip=$1
users=("robert", "robot", "lfgberg", "sheriffcy", "freakyfox8100", "meowmeowmeow", "mynameisbailey", "yoinkus")

for user in ${users}; do
    /root/sliver-server operator --name $user --lhost $ip
done

# Zip em
zip archive_name.zip $(find . -type f -name "*.cfg")
