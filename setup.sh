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
echo "Load emacs config from dotfiles repo instead of ~/.emacs"
echo '(load "~/dotfiles/emacs/init.el")' > ~/.emacs

# Bash

if grep -q 'source ~/dotfiles/bash_config.sh' ~/.bash_profile
then
	echo "~/.bash_profile already sources ~/dotfiles/bash_config.sh; skipping..."
else
	echo "Sourcing ~/dotfiles/bash_config.sh from ~/.bash_profile"
	echo -e '\n\n# Configuration to be shared across machines lives in the dotfiles repo' >> ~/.bash_profile
	echo '# (see http://github.com/noahlt/dotfiles)'
	echo 'source ~/dotfiles/bash_config.sh' >> ~/.bash_profile
fi

# Setup custom keyboard.

echo "Copying NoahDvorak to ~/Library/Keyboard Layouts"
cp ./NoahDvorak.keylayout ~/Library/Keyboard\ Layouts/NoahDvorak.keylayout

echo "Swapping Command_R and Option_R"
/Applications/Karabiner.app/Contents/Library/bin/karabiner enable remap.commandR2optionR
/Applications/Karabiner.app/Contents/Library/bin/karabiner enable remap.optionrcommandr

echo "###########################################################################"
echo "#                                                                         #"
echo "#     Now open System Preferences > Language & Region and change your     #"
echo "#     input source to 'Noah Dvorak'.                                      #"
echo "#                                                                         #"
echo "###########################################################################"
