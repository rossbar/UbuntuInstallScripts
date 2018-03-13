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
dpkg -i $CUDA_PKG
# Install using apt-get
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
apt-get update
apt-get install -y cuda

# Update path/lib info in bashrc
echo "# CUDA" >> $HOME/.bashrc
echo "export PATH=$CUDA_INSTALL_PATH/bin:$PATH" >> $HOME/.bashrc
echo "export LD_LIBRARY_PATH=$CUDA_INSTALL_PATH/lib64:$LD_LIBRARY_PATH" >> $HOME/.bashrc
