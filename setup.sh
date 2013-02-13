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
