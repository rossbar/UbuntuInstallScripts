#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

pip install --upgrade tornado distribute jinja2 six numpy ipython matplotlib scipy pandas scikit-image scikit-learn mayavi
