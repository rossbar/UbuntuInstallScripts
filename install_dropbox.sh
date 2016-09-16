#! /bin/bash

# NOTE: Removed libboost: libboost1.55-all-dev doesn't play nice with ros-indigo

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Get appropriate link for dropbox deb (32 or 64 bit .deb)
if [ `uname -m` == "x86_64" ]; then
    echo "Detected 64-bit OS"
    DB_LINK="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb";
elif [ `uname -m` == "i386" ]; then
    echo "Detected 32-bit OS";
    DB_LINK="https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_i386.deb";
else
    echo "ERROR: Unknown system architecture: `uname -m`"
    echo "Supported architectures: x86_64, i386"
    echo "Please install dropbox manually"
    exit 1;
fi

# Download
DL_LOC=$HOME/Downloads
PKG_NAME="dropbox_$(uname -m).deb"
mkdir -p $DL_LOC
cd $DL_LOC
wget -O $PKG_NAME $DB_LINK 

# Install
dpkg -i $PKG_NAME
# Remove deb
rm $DL_LOC/$PKG_NAME

echo "Dropbox ready to be configured... run \$ dropbox start to continue."
