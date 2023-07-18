## Check latest SHA of my branch
```
git rev-parse HEAD
```

## Merging conflict due to the very file you want to push!
if the only conflict is the changes you made, simply
```
git pull
git merge --no-ff
git push
```
if there is a file you have to resolve, after fixing it, then

##  going back to a git commit while preserving history
(I'm not sure if this works, actually)
```
git reset --soft 1c0043a5d67aad8244ead51d6c75c588f080098a
git commit -m 'restored to commit _________'
git push -f origin [branch name]
```
## reset to a git commit, deleting history
```
git log  # to get the hash
git reset --hard [hash]
git push --force
```

## Reset to HEAD
git reset --hard HEAD

## Check changes before I commit
git diff HEAD

## "Please update your branches"
1. wd to all my branches and make sure I don't need to push any changes
2. Then:
```
wd oddball
rm -rf notification-api
rm -rf notification-api-qa
rm -rf vanotify-infra
rm -rf vanotify-team
git clone git@github.com:department-of-veterans-affairs/vanotify-team.git 
git clone git@github.com:department-of-veterans-affairs/vanotify-infra.git
git clone git@github.com:department-of-veterans-affairs/notification-api.git
git clone git@github.com:department-of-veterans-affairs/notification-api-qa.git
```
or just
```
git checkout master
git pull
```
5. Then, whenever you open a new branch, get in a habit of merging branch with latest master
## merge branch with latest master
```
git checkout master
git pull origin master
git checkout [branch]
git merge master
git push origin [branch]
```
6. If there's a merge conflict, and you want the master version:
```
git checkout --theirs [file path] [file path]
```
## comparing difference of my branch to master
```
git diff master --name-only
git diff master [filename]
```

## list all files in the current directory by last modification date
```
git ls-files | while read file; do echo "$(git log -1 --format="%ad" -- "$file") $file"; done | sort
```

## rename a branch
in my zshrc is git-rename-branch()

git branch -m [old-branch-name] [new-branch-name]
git push origin [new-branch-name]
**delete old branch**

## delete a branch

git checkout master
git branch -d [branchname]
git push origin --delete [branchname]

OR

git ls-remote --refs origin | grep [whatever]
git push origin --delete [branch]
git worktree remove devops-969-actions-env-debug
git branch -D [branch]   # not always necessary for worktrees

## skip ci/cd trigger
git commit -m "[skip ci] whatever else you want to say"

## make a new branch

git checkout -b [branchname]
git push -u origin [branchname]
git branch --set-upstream-to=origin/[branchname] [branchname]
  e.g.
  git branch --set-upstream-to=origin/trigger-testing trigger-testing


## restoring a file to the master version
git restore --source=master [file you want to restore]
git restore --source=master ./scripts/run_ci_migrations.sh
or sometimes
rm -rf [the file]
git checkout origin/master -- [filename]
