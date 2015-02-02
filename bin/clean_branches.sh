#/bin/bash

echo 'Branches already merged into master:'
git branch --merged master | sed 's/^../  /'
read -p 'OK to delete those branches? (y/n) ' RESP

if [ "$RESP" = "y" ]
then
    git branch -D $(git branch --merged master | sed 's/^..//' | sed 's/master//')
else
    echo 'exiting.'
fi

# possible future improvements:
#  - print out branches that have not been touched for a month
#  - try to detect cherry-picks (identical diffs or commit mesgs?)
