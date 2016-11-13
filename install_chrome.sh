#! /bin/bash

# NOTE: Removed libboost: libboost1.55-all-dev doesn't play nice with ros-indigo

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

DL_LINK=https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
DL_NAME=google_chrome.deb
mkdir -p $HOME/InstallationFiles
cd $HOME/InstallationFiles
wget -O $DL_NAME $DL_LINK

# Install
dpkg -i $DL_NAME 
