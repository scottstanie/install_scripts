#!/bin/bash

# First portion taken from a tensor flow setup for centos
# https://gist.github.com/thoolihan/28679cd8156744a62f88
sudo yum -y install epel-release
sudo yum -y install gcc gcc-c++ python34-devel atlas atlas-devel gcc-gfortran openssl-devel libffi-devel

# Install and set up virtual environments
sudo yum install python34-setuptools
sudo easy_install-3.4 pip
sudo pip3 install virtualenv virtualenvwrapper

# Note: I have these 3 lines in my ~/.bashrc to run every login
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3  # Using python3, as opposed to 2.7
export WORKON_HOME=~/envs
source /usr/bin/virtualenvwrapper.sh

# Note; change the name below from "myenv" to something better
mkvirtualenv myenv
# Now some nice scientific packages
pip3 install --upgrade numpy scipy wheel cryptography ipython pillow

# For tensorflow: I don't yet know what kind of GPU this machine has, so I'm installing CPU only
pip3 install -U tensorflow


# Finally, the suggested ISCE environment setup from JPL
export ISCE_INSTALL_ROOT=/home/scott/isce
export PYTHONPATH=$ISCE_INSTALL_ROOT:$PYTHONPATH
export ISCE_HOME=$ISCE_INSTALL_ROOT/isce
export PATH=$ISCE_HOME/applications:$PATH

