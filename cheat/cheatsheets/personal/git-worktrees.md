# how to make a new branch

# Start a new worktree from a current branch
```
git worktree add [branch name]
cd <worktree_directory>
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
