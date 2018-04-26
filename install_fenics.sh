#! /bin/bash

# NOTE: Installation instructions taken directly from FEniCS installation page:
# https://fenicsproject.org/download/

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt-get install software-properties-common
add-apt-repository ppa:fenics-packages/fenics
apt-get update
apt-get install --no-install-recommends fenics
apt-get dist-upgrade
