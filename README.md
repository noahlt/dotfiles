Noah's Configuration Files
--------------------------

For now, this repo only contains my custom keyboard setup for OS X, which does three things:

 1. switch keyboard layout to Dvorak
 2. when holding down the Option modifier, keys on home row insert parentheses and braces.
 3. swap the right Command and Option keys

To use this keyboard configuration, run:

    $ ./install.sh

After `install.sh` finishes, you'll have to reboot, and then run:

    $ ./setup.sh

Then you'll need to open System Preferences > Language & Text and change your input source to 'Noah Dvorak'.
