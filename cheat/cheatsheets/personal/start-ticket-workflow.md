# Start Working on a Ticket
### quick notes:
- I recommend having your repos in ~/oddball for the cd commands to work
- this workflow is based on vanotify-team/Engineering/team_agreement.md, which may be updated before this file.  If you notice this, please message Lucas!
- having the same labels for the issue and PR are highly recommended

### For newcomers, onboarding, or quick reference: 
```
mkdir ~/oddball
cd ~/oddball
git clone git@github.com:department-of-veterans-affairs/notification-api.git
git clone git@github.com:department-of-veterans-affairs/vanotify-team.git
```

## Find your ticket
```
gh issue list
gh issue edit --add-assignee [github username]
```

## Create a branch for your issue 
create a branch for the issue
```
git checkout -b [[issue_number]-some-detail-about-issue]
git push -u origin [[issue_number]-some-detail-about-issue]
```
e.g. 
```
git checkout -b 947-set-output-deprecation
git push -u origin 947-set-output-deprecation
```
you are now on the new branch.

## Check if a pr is open for the ticket
```
gh pr list
```
If it's not, create a pr with the following section

## Create a draft PR (if one doesn't exist)
copy the draft pr template and then edit it for the branch and issue
```
cd ~/oddball/vanotify-team
cp Engineering/DevOps/templates/pull-request-draft.md \
pull-request-draft-copy.md
```
edit the file how you want, (I like to edit with vim):
```
vim pull-request-draft-copy.md
```
## Connect the branch to pr draft 
- make sure you are in the va-notify repo directory!
- apply as many labels as you want (see example)
```
cd ~/github/notification-api
gh pr create \
-R department-of-veterans-affairs/notification-api
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
-H 947-set-output-deprecation \
-F pull-request-draft-copy.md \
-a ldraney \
-l Notify \
-l devops \
-l github_actions \
-t '#947 solved warning and deprecation'
```

## verify it worked
verify pull requests is in this list:  
```
gh pr list
```
view your ticket in the browser
```
gh pr view -w [pr issue number]
```
Then, ask leader if you can add the ticket to the current sprint, and adjust it on the GUI

## Start Developing! 

## Getting ready for PR review
in the github GUI, take off draft from PR and send a link of the PR to the va-notify-engineers slack channel!

## deleting your branch
once you finish this whole flow with an approved PR (congratulations!), we no longer need your branch: 
```
git push origin -d [development branch name]
```
