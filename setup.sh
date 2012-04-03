#!/bin/bash

# Setup custom keyboard.

cp ./NoahDvorak.keylayout ~/Library/Keyboard\ Layouts/NoahDvorak.keylayout
if [ ! -d /Library/org.pqrs/KeyRemap4MacBook/ ]
then
	curl -o ~/Downloads/KeyRemap4MacBook-7.5.0.pkg.zip http://pqrs.org/macosx/keyremap4macbook/files/KeyRemap4MacBook-7.5.0.pkg.zip
	pushd ~/Downloads
	unzip KeyRemap4MacBook-7.5.0.pkg.zip
	sudo installer -pkg ./KeyRemap4MacBook.pkg -target /
	popd
fi
/Library/org.pqrs/KeyRemap4MacBook/app/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli enable remap.commandR2optionR
