#!/bin/bash

USER=`whoami`

# add wicd to the apt repositories
UBUNTU_VERSION=`grep CODENAME /etc/lsb-release | sed s/.*=//`
echo deb http://apt.wicd.net $UBUNTU_VERSION extras | sudo tee -a /etc/apt/sources.list

# install stuff
sudo apt-get install wmii emacs rxvt gpomme python-setuptools wicd

# web dev stuff
sudo easy_install pylons
