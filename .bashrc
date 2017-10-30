# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=~/envs
source /usr/bin/virtualenvwrapper.sh


# Git shortcuts
alias st='git status'
alias ci='git commit'
alias gpsh='git push'
alias gb='git branch'
alias gpl='git pull'
alias gk='git checkout'

alias ..='cd ..'
alias cl='clear'
alias lm='ls -laxo | more'
alias rm='rm -i'


export CUDA_HOME=/usr/local/cuda-8.0
export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:$LD_LIBRARY_PATH
export PATH=${CUDA_HOME}/bin:${PATH}


export ISCE_INSTALL_ROOT=/home/scott/isce
export PYTHONPATH=$ISCE_INSTALL_ROOT:$PYTHONPATH
export ISCE_HOME=$ISCE_INSTALL_ROOT/isce
export PATH=$ISCE_HOME/applications:$PATH


