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

# tmux

if [ -e ~/.tmux.conf ]
then
	echo "~/.tmux.conf already exists; skipping..."
else
	echo "Symlinking dotfiles/tmux.conf to ~/.tmux.conf"
	ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
fi

# Setup custom keyboard.

KEYLAYOUT_DEST='~/Library/Keyboard Layouts/Noah Dvorak.bundle/'
if [ -d "$KEYLAYOUT_DEST" ]
then
	echo "Noah Dvorak keylayout already installed"
else
	echo "Copying NoahDvorak to ~/Library/Keyboard Layouts"
	cp -r ./Noah\ Dvorak.bundle ~/Library/Keyboard\ Layouts/
fi

# TODO: Karabiner config https://karabiner-elements.pqrs.org/docs/manual/misc/command-line-interface/

echo "###########################################################################"
echo "#                                                                         #"
echo "#     Now open System Preferences > Language & Region and change your     #"
echo "#     input source to 'Noah Dvorak'.                                      #"
echo "#                                                                         #"
echo "###########################################################################"
