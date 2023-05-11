# how to make a new branch

# Start a new worktree from a current branch
```
git worktree add [ticketNumber]-[ticketTitle]
# git push -u origin [branchname]
git push --set-upstream origin [branchname]
new-branch-wd [branchname]
```

# create new wd directories for the new worktree
This command makes it so a `wd 538` would go to the appropriate spot
```
new-branch-wd [branchname]
```

# Start a worktree clone (bare repository with master)
```
git clone --bare git@github.com:department-of-veterans-affairs/notification-api.git notification-api
git clone --bare git@github.com:department-of-veterans-affairs/vanotify-infra.git vanotify-infra
cd notification-api
git worktree add master
```

git worktree remov
git worktree remove 531-qa-regression-ec2
