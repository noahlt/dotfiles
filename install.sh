#!/bin/bash

echo "Copying utility scripts into ~/bin"
mkdir -p ~/bin
cp ./bin/* ~/bin


if [ ! -d /Library/org.pqrs/KeyRemap4MacBook/ ]
then
	echo "Installing KeyRemap4MacBook..."
	pushd ~/Downloads
	curl -o ./Karabiner-10.4.0.dmg https://pqrs.org/osx/karabiner/files/Karabiner-10.4.0.dmg
	hdiutil attach ./Karabiner-10.4.0.dmg
	sudo installer -pkg /Volumes/Karabiner-10.4.0/Karabiner.pkg -target /
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
