## merging to master
git checkout master
git pull origin master
git checkout [branch]
git merge master
git push origin [branch]

## rename a branch
git branch -m [old-branch-name] [new-branch-name]
git push origin [new-branch-name]
**delete old branch**

## delete a branch

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
