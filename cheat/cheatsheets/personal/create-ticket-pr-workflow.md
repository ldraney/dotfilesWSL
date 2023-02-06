# Creating a Ticket or Start working on one

## Create a ticket
### first copy the template
```
wd issue_templates
cp [template] /tmp/[template]
vim /tmp/[template]
#delete the first part of the ticket (e.g. assignee) as these are used in the command
```

### create the issue (ticket)
```
wd [related repo]
gh issue create \
-F /tmp/template \
--title "Datadog Optimization for AWS Services" \
--assignee ldraney \
--label Notify \
--label devops \
--label epic/bug/[none]
```

## Starting work on a ticket
### Create and Checkout new branch for your issue 
** If you already created a branch, skip this and go to the "Create a draft PR" section
** this won't work if the issue was not created in the repo you are editing.  Please fix that first via Zenhub.
```
gh issue develop \
--base master \
--checkout \
--issue-repo department-of-veterans-affairs/notification-api \
--name [[issue_number]-some-detail-about-issue] \
[ticket number]
```
e.g.
```
gh issue develop \
--base master \
--checkout \
--issue-repo department-of-veterans-affairs/vanotify-infra \
--name 662-understand-datadog \
662
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
