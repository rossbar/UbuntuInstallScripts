#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Install dependencies
apt-get install -y tcl-vtk python-vtk

# So far, I've only been able to get 4.4.4 to build and run properly
pip install --upgrade mayavi==4.4.4
