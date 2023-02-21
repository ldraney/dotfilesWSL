#set up a stash system so all conflicts are handled with stashes rather than the 
#main repo, thus taking the risk of accidentally overwriting the current branch 
#or losing local changes
#git config pull.rebase true
#git config rebase.autoStash true
#or perhaps
##git stash store "$(git stash create)"
cd $HOME/github/dotfilesWSL
git status
cd $HOME/github/ansible_desktop_setup_WSL
git status
cd $HOME/github/sensitive
git status
