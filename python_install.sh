#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt-get install -y python-dev python-numpy python-matplotlib wx-common python-wxmpl python-wxgtk2.8 python-setuptools python-vtk python-pyrex python-enthoughtbase python-numexpr cython python-scipy python-tables pyside-tools python-pyside python-opengl ipython ipython-notebook python-sklearn python-rope
