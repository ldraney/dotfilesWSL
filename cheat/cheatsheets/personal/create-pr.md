# Create a PR for your ticket/branch
### Edit a draft PR
- GUI option: ** If its not a ticket and just a quick PR, then make a branch, make changes, the go to https://github.com/department-of-veterans-affairs/notification-api/branches
- if QA is on the ticket, Don't put `Fixes #` in the description.  
- When I open a PR, the ticket should be moved to the DEV lane.
- make at least one change to the new local branch, then
```
wd pr-template   
cp pull-request-draft.md /tmp/pr-[branch-name].md 
vim /tmp/pr-[branch-name].md
```
### ChatGPT
ask chatGPT to use this template as the basis for converting the zenhub ticket to a PR

#### Don't know what to put for the PR? 
- Review https://github.com/department-of-veterans-affairs/vanotify-team/blob/master/Engineering/team_agreement.md#opening-and-reviewing-prs
  Relevant points:
  * include documentation if possible
  * paraphrase the original ticket, or quote it, but include the original context and accomplishment
  * make sure original ticket number is in the name

### Create pr draft with branch connected 
- apply as many labels as you want (see example) -- there are some labels that shouldn't be added
- your branch will need to be at least one commit different from master for this to work
- don't put the Notify label as it creates duplicates!  (That label should only be on the issue)
```
wd [repo you created ticket and branch]
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
- note* you will have to make one file change, make sure not to make/delete a testfile, cause that will close the PR!
```
##  GO TO REPO, and then:
gh pr create \
-R department-of-veterans-affairs/notification-api \
-d \
-B master \
-H 1214-github-pre-release-trigger-failure \
-F /tmp/pr-1214.md \
-a ldraney \
-l devops \
-t '#1214 Fix Pre-release Trigger for GitHub Actions final fix'

-R department-of-veterans-affairs/notification-api \
-R department-of-veterans-affairs/notification-api-qa \
-R department-of-veterans-affairs/vanotify-infra \
```

-l github_actions \



# Opening a PR
```
cheat open-pr.md
```
