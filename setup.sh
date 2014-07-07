#!/bin/bash

echo "Show Library directory in Finder"
chflags nohidden ~/Library/

echo "Save screenshots to ~/Pictures/Screenshots"
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots
killall SystemUIServer # for the changes to take effect immediately

echo "Hide all desktop icons"
defaults write com.apple.finder CreateDesktop -bool false
killall Finder # for the changes to take effect immediately

echo "Load emacs config from dotfiles repo instead of ~/.emacs"
if [ -e ~/.emacs ]
then
    if [ -e ~/.emacs.old ]
    then
	echo
	echo "* Couldn't back up ~/.emacs to ~/.emacs.old because it already exists!"
	echo "* If you don't care about the contents of ~/.emacs.old, then you can"
        echo "* delete that file and try running this script again."
	echo
	echo "Quitting."
	exit 1
    else
	echo "(copying old ~/.emacs to ~/.emacs.old)"
	mv ~/.emacs ~/.emacs.old
    fi
fi
echo '(load "~/dotfiles/emacs/init.el")' > ~/.emacs

# Setup custom keyboard.

echo "Copying NoahDvorak to ~/Library/Keyboard Layouts"
cp ./NoahDvorak.keylayout ~/Library/Keyboard\ Layouts/NoahDvorak.keylayout

echo "Swapping Command_R and Option_R"
/Library/org.pqrs/KeyRemap4MacBook/app/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli enable remap.commandR2optionR
/Library/org.pqrs/KeyRemap4MacBook/app/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli enable remap.optionrcommandr

echo "###########################################################################"
echo "#                                                                         #"
echo "#     Now open System Preferences > Language & Text and change your       #"
echo "#     input source to 'Noah Dvorak'.                                      #"
echo "#                                                                         #"
echo "###########################################################################"
