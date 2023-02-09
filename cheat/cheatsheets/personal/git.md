## skip ci/cd trigger
git commit -m "[skip ci] whatever else you want to say"


## delete a branch

git branch -d [branchname]
git push origin --delete [branchname]


## make a new branch

git checkout -b [branchname]
git push -u origin [branchname]
git branch --set-upstream-to=origin/[branchname] [branchname]
  e.g.
  git branch --set-upstream-to=origin/trigger-testing trigger-testing
