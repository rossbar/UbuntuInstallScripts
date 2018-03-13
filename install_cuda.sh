#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Ensure linux-headers are installed
apt-get install -y linux-headers-$(uname -r)
# Unpack downloaded .deb
dpkg -i $HOME/Downloads/cuda-repo-*.deb
# Install using apt-get
apt-get update
apt-get install
