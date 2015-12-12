#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

CUDA_SAMPLE_DIR=$HOME/InstallationFiles/cuda

# Download package
wget -P $HOME/Downloads http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
cd $HOME/Downloads
# Unpack
sudo dpkg -i cuda-repo-ubuntu1404-7-5-local_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get install -y cuda
# Install cuda samples
mkdir -p $CUDA_SAMPLE_DIR
/usr/local/cuda/bin/cuda-install-samples-7.5.sh $CUDA_SAMPLE_DIR
