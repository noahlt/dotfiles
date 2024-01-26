#!/bin/bash

echo "Copying utility scripts into ~/bin"
mkdir -p ~/bin
cp ./bin/* ~/bin


if [ ! -d /Applications/Karabiner-Elements.app/ ]
then
	echo "Installing Karabiner-Elements..."
	brew install --cask karabiner-elements
else
	echo "Karabiner-Elements appears already installed."
	echo "Go ahead and run ./setup.sh"
fi
