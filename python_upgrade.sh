#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

for PACKAGE in setuptools tornado distribute jinja2 six numpy ipython matplotlib cython scipy pandas scikit-image scikit-learn ntplib tables pyvtk numexpr pyopengl rope netifaces pyqtgraph progressbar
do
	pip install --upgrade $PACKAGE
done
