#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Install virtualenv and wrapper
pip install virtualenv
pip install virtualenvwrapper

# Set up wrapper
echo '# For python virtualenv' >> $HOME/.bashrc
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $HOME/.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $HOME/.bashrc
echo 'export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'' >> $HOME/.bashrc
