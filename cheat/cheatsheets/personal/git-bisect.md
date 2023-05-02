## quick process
```
git log
  # new tmux tab
git bisect log 
git checkout [commit-from-git-log]
  # run some test, like retest-profiling
git bisect good 
git switch - 
```

## if you see a mistake on git bisect view
```
git bisect log > /tmp/bisect_log.txt
vim /tmp/bisect_log.txt   # to delete any line you don't want, this is just a txt file for personal reference
git bisect reset
git bisect replay /tmp/bisect_log.txt
git bisect view
```

## elaborated process
To walk through your git commit history and figure out your latest working commit, you can use the following commands:

- `git log`: This command shows the commit logs in reverse chronological order, with the most recent commit at the top. You can use various options to format the output or filter the results:
  - `git log --oneline`: Shows a condensed view of the commit history, displaying the commit hash and commit message in one line.
  - `git log --graph --oneline --decorate --all`: Displays a visual representation of the commit history, including branches and tags.
  - `git log -n <number>`: Limits the output to the specified number of commits. Replace `<number>` with the number of commits you'd like to display.
  
- `git checkout <commit-hash>`: To go back to a specific commit, replace `<commit-hash>` with the hash of the commit you want to check out. This will place you in a detached HEAD state, allowing you to explore the code at that point in history.

- `git bisect`: If you're trying to find a specific commit that introduced a bug, you can use `git bisect` to perform a binary search between a known good commit and a known bad commit. Follow these steps:
  - Start the bisect process: `git bisect start`
  - Mark the current commit as bad: `git bisect bad`
  - Mark a known good commit: `git bisect good <commit-hash>`
  - Git will then guide you through the process of checking out commits and marking them as good or bad until it finds the commit that introduced the bug.


Start the bisect process: `git bisect start
Mark the current commit as bad: git bisect bad
Mark a known good commit: git bisect good <commit-hash>
Once you've found the latest working commit, you can either create a new branch from that point or reset your current branch to that commit using git reset or git revert, depending on your needs. Remember to make a backup or create a new branch before making any destructive changes to your repository.
