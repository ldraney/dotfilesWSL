
** This needs to be turned into a python script so that an issue can be linked to an epic from the CLI

## first copy the template
```
wd issue_templates
cp [template] /tmp/[template]
vim /tmp/[template]
```

## create the issue (ticket)
```
gh issue create \
-F /tmp/template \
--title "Datadog Optimization for AWS Services" \
--assignee ldraney \
--label Notify \
--label devops \
--label epic/bug/[none]
```

## Create and Checkout new branch for your issue 
** this won't work if the issue was not created in the repo you are editing.  
** If they are different, run `git checkout -b [new-branch`
```
gh issue develop \
--base master \
--checkout \
--issue-repo department-of-veterans-affairs/vanotify-infra \
--name 662-understand-datadog \
662
```
e.g.
```
gh issue develop \
--base master \
--checkout \
--issue-repo department-of-veterans-affairs/notification-api \
--name [[issue_number]-some-detail-about-issue] \
--issue [branch you just created] \
```
and verify your branch is linked to the issue: 
```
gh issue develop --list [issue-number]
```
e.g.
```
gh issue develop --list 909
```
you are now on the new branch.  


## Create a draft PR
copy the draft pr template and then edit it for the branch and issue
```
wd pr-template
cp pull-request-draft.md /tmp/pull-request-draft.md 
vim /tmp/pull-request-draft.md
```

## Connect the branch to pr draft 
- apply as many labels as you want (see example)
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
-R department-of-veterans-affairs/vanotify-infra \
-d \
-B master \
-H 466-update-terraform \
-F /tmp/pull-request-draft.md \
-a ldraney \
-l devops \
-l github_actions \
-t '#466 updating Terraform to latest version'
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
## add issue to epic
Unfortunately, have to do this through the GUI: https://github.com/department-of-veterans-affairs/vanotify-infra/issues

## Start Developing! 
Maybe ask a leader if you can add the ticket to the current sprint, and adjust it on the GUI

## Getting ready for PR review
- in the github GUI, take off draft from PR
- send a link of the PR to the va-notify-engineers slack channel so they can review it! 
- Move your issue from in Progress to Done.  

## deleting your branch
once you finish this whole flow with an approved PR (congratulations!), we no longer need your branch: 
```
git push origin -d [development branch name]
```
