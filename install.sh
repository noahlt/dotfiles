#!/bin/bash

if [ ! -d /Library/org.pqrs/KeyRemap4MacBook/ ]
then
	echo "Installing KeyRemap4MacBook..."
	pushd ~/Downloads
	curl -o ./KeyRemap4MacBook-7.5.0.pkg.zip http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.5.0.pkg.zip
	unzip KeyRemap4MacBook-7.5.0.pkg.zip
	sudo installer -pkg ./KeyRemap4MacBook.pkg -target /
	popd

	echo "###########################################################################"
	echo "#                                                                         #"
	echo "#  Installation complete. Restart your computer now, then run ./setup.sh  #"
	echo "#                                                                         #"
	echo "###########################################################################"
else
	echo "No installation necessary - KeyRemap4MacBook appears already installed."
	echo "Go ahead and run ./setup.sh"
fi
