#!/bin/bash

USER=noah

# add wicd to the apt repositories
echo deb http://apt.wicd.net gutsy extras

# install stuff
sudo apt-get install wmii emacs rxvt gpomme wicd

# copy wmii configuration files
WMII_VERSION=`wmii -v | sed s/,.*//`
if [ -e /etc/X11/$WMII_VERSION ]
then
  cp /etc/X11/$WMII_VERSION/* ~/$WMII_VERSION
  sudo chown $USER ~/$WMII_VERSION/*
  sudo chgrp $USER ~/$WMII_VERSION/*
fi
