# Start Working on a Ticket
### Create and Checkout new branch for your issue 
** gh issue develop command is now deprecated
```
git checkout -b [branchname]
git push -u origin [branchname]
git branch --set-upstream-to=origin/[branchname] [branchname]
  e.g.
  git branch --set-upstream-to=origin/trigger-testing trigger-testing
```

### Create a draft PR
1. cd to the templates (below I use wd rather than cd)
2. copy the draft pr template
3. edit it for the branch and issue
```
wd pr-template   
# cd $HOME/[oddball_repo_dir]\vanotify-team/Engineering/DevOps/templates

cp pull-request-draft.md /tmp/pr-[branch-name].md 
vim /tmp/pr-[branch-name].md
```
You will use your file in the next section

Review https://github.com/department-of-veterans-affairs/vanotify-team/blob/master/Engineering/team_agreement.md#opening-and-reviewing-prs
Relevant points:
- include documentation if possible
- paraphrase the original ticket, or quote it, but include the original context and accomplishment

### Connect the branch to pr draft 
- apply as many labels as you want (see example) -- there are some labels that shouldn't be added
- your branch will need to be at least one commit different from master for this to work
- don't put the Notify label as it creates duplicates!  (That label should only be on the issue)
```
cd ~/github/[repo you created ticket and branch]
gh pr create \
-R department-of-veterans-affairs/vanotify-infra \
-d \
-B master \
-H [development branch name] \
-F ~/oddball/vanotify-team/Engineering/DevOps/templates/pull-request-draft-copy.md \
-a [your github username] \
-l Notify \
-t '#[[ticketNumber] a short description]'
```
e.g
```
gh pr create \
-R department-of-veterans-affairs/notification-api \
-d \
-B master \
-H hotfix-twistlock-github-event \
-F /tmp/pr-hotfix-twistlock-github-event.md \
-a ldraney \
-l devops \
-l github_actions \
-t 'hotfix for latest twistlock merge - syntax fix'
```

### verify it worked
verify pull requests is in this list:  
```
gh pr list
```
view your ticket in the browser
```
gh pr view -w [pr issue number]
```
<!--## add issue to epic-->
<!--Unfortunately, have to do this through the GUI: https://github.com/department-of-veterans-affairs/vanotify-infra/issues-->
<!-- I don't think this is the appropriate place for this step -->

## Getting ready for PR review
- in the github GUI, take off draft from PR (at the bottom of the PR page)
- send a link of the PR to the va-notify-engineers slack channel so they can review it!

## deleting your branch
once you finish this whole flow with an approved PR (congratulations!), we no longer need your branch: 
Sometimes the merge will delete your branch automatically, but if not:
```
git checkout -D [branch]
git push origin -d [branch]
```
