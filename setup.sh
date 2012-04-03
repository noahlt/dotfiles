#!/bin/bash

# Setup custom keyboard.

echo "Copying NoahDvorak to ~/Library/Keyboard Layouts"
cp ./NoahDvorak.keylayout ~/Library/Keyboard\ Layouts/NoahDvorak.keylayout

echo "Swapping Command_R and Option_R"
/Library/org.pqrs/KeyRemap4MacBook/app/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli enable remap.commandR2optionR
/Library/org.pqrs/KeyRemap4MacBook/app/KeyRemap4MacBook_cli.app/Contents/MacOS/KeyRemap4MacBook_cli enable remap.optionrcommandr
