#! /bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

# Install virtualenv and wrapper
pip install --upgrade virtualenv
pip install --upgrade virtualenvwrapper

# Apply changes (with correct permissions)
sudo -u $USER bash<<___
  export WORKON_HOME=$HOME/.virtualenvs
  source /usr/local/bin/virtualenvwrapper.sh
  export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
___

# Set up env in .bashrc
echo '# For python virtualenv' >> $HOME/.bashrc
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> $HOME/.bashrc
echo 'source /usr/local/bin/virtualenvwrapper.sh' >> $HOME/.bashrc
echo 'export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'' >> $HOME/.bashrc
