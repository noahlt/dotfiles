#!/bin/bash

USER=`whoami`

# add wicd to the apt repositories
UBUNTU_VERSION=`grep CODENAME /etc/lsb-release | sed s/.*=//`
echo deb http://apt.wicd.net $UBUNTU_VERSION extras | sudo tee -a /etc/apt/sources.list

# install stuff
sudo apt-get install wmii emacs rxvt gpomme python-setuptools wicd

# copy wmii configuration files
WMII_VERSION=`wmii -v | sed s/,.*//`
if [ -e /etc/X11/$WMII_VERSION ]
then
  cp /etc/X11/$WMII_VERSION/* ~/$WMII_VERSION
  sudo chown $USER ~/$WMII_VERSION/*
  sudo chgrp $USER ~/$WMII_VERSION/*
fi


# web dev stuff
sudo easy_install pylons
