#!/bin/bash
#set up a stash system so all conflicts are handled with stashes rather than the 
#main repo, thus taking the risk of accidentally overwriting the current branch 
#or losing local changes
#git config pull.rebase true
#git config rebase.autoStash true
#or perhaps
##git stash store "$(git stash create)"

cd $HOME/github/dotfilesWSL
git config pull.rebase true
git config rebase.autoStash true
git pull && git add -A && git commit -m $1 && git push
cd $HOME/github/ansible_desktop_setup_WSL
git config pull.rebase true
git config rebase.autoStash true
git pull && git add -A && git commit -m $1 && git push
cd $HOME/github/sensitive
git config pull.rebase true
git config rebase.autoStash true
git pull && git add -A && git commit -m $1 && git push
