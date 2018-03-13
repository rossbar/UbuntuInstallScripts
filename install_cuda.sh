#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Extract cuda toolkit version
CUDA_PKG=`ls $HOME/Downloads/cuda-repo*.deb`
CUDA_REVSTR=`echo $CUDA_PKG | cut -d'_' -f 2`
MAJ_REV=`echo $CUDA_REVSTR | cut -d'.' -f 1`
MIN_REV=`echo $CUDA_REVSTR | cut -d'.' -f 2`
CUDA_INSTALL_PATH=/usr/local/cuda-$MAJ_REV.$MIN_REV

# Ensure linux-headers are installed
apt-get install -y linux-headers-$(uname -r)
# Unpack downloaded .deb
dpkg -i $HOME/Downloads/$CUDA_PKG
# Install using apt-get
apt-get update
apt-get install

# Update path/lib info in bashrc
echo "# CUDA" >> $HOME/.bashrc
echo "export PATH=$CUDA_INSTALL_PATH/bin:$PATH" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=$CUDA_INSTALL_PATH/lib64:$LD_LIBRARY_PATH" >> $HOME/.bashrc
