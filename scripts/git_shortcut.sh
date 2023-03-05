#!/bin/bash
#must be in the same dir with bash_shortcuts.sh

git add *
git status
echo "add commit ya gever:"
read commit
git commit -m "$commit"
git push
