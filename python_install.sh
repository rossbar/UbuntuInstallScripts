#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt-get install -y python-dev wx-common python-wxgtk3.0-dev python-enthoughtbase pyside-tools python-qt4-gl python3-dev
