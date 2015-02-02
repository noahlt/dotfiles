Noah's Configuration Files
--------------------------

This repo is a menagerie of my configuration files from various times in my life.  Right now it most notably contains my bash and keyboard configurations.

### Keyboard customizations:

 1. switch keyboard layout to Dvorak
 2. when holding down the Option modifier, keys on home row insert parentheses and braces.
 3. swap the right Command and Option keys

### Bash configuration

 1. Custom prompt shows time, cwd, and git branch
 2. A few aliases to make things more convenient
 3. Git branch tab-completion
 4. Extra commands:
     - `killport` kills the process at the specified port
     - `clean_branches.sh` deletes local git branches that have been merged to master

## Installation

To use these configurations, run:

    $ ./install.sh

After `install.sh` finishes, you'll have to reboot, and then run:

    $ ./setup.sh

Then you'll need to open System Preferences > Language & Text and change your input source to 'Noah Dvorak'.
