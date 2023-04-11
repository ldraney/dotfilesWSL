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
3. Then, whenever you open a new branch, get in a habit of merging branch with latest master
## merge branch with latest master
```
git checkout master
git pull origin master
git checkout [branch]
git merge master
git push origin [branch]
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


## Merging conflict due to the very file you want to push!
if the only conflict is the changes you made, simply
```
git pull
git merge --no-ff
git push
```

## rename a branch
git branch -m [old-branch-name] [new-branch-name]
git push origin [new-branch-name]
**delete old branch**

## delete a branch

git checkout master
git branch -d [branchname]
git push origin --delete [branchname]

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
