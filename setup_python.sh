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

# For gpu tensorflow install, https://gist.github.com/lucduong/f635cbe43372b0ffbe14d5966f82e003
sudo yum install kernel-headers
# https://developer.nvidia.com/cuda-80-ga2-download-archive
# http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#axzz4VZnqTJ2A
# After downloading and scping the file 
# Note: right now TF does not support CUDA 9.0 as of 10/30/17
sudo rpm -i cuda-repo-rhel7-8.0.61-1.x86_64.rpm
sudo yum clean all
sudo yum install cuda

export CUDA_HOME=/usr/local/cuda-8.0
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
export PATH=${CUDA_HOME}/bin:${PATH}

# After downloading cuDNN from https://developer.nvidia.com/rdp/cudnn-download
tar zxvf cudnn-8.0-linux-x64-v6.0.tgz
cd cuda
sudo cp lib64/* /usr/local/cuda/lib64/
sudo cp include/* /usr/local/cuda/include/
sudo cp lib64/* /usr/local/cuda-8.0/lib64/
sudo cp include/* /usr/local/cuda-8.0/include/


# Finally, the suggested ISCE environment setup from JPL
export ISCE_INSTALL_ROOT=/home/scott/isce
export PYTHONPATH=$ISCE_INSTALL_ROOT:$PYTHONPATH
export ISCE_HOME=$ISCE_INSTALL_ROOT/isce
export PATH=$ISCE_HOME/applications:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:$LB_LIBRARY_PATH

