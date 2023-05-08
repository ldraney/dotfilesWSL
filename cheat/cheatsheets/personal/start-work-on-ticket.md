# Start Working on a Ticket

### Is there QA on the ticket?
- If there is, the moment i understand the ticket, ping QA
- She wants a meeting, say "yo, let's chat for fifteen about my understaanding of the ticket"

### Create and Checkout new branch for your issue 
```
git worktree add [ticketNumber]-[ticketTitle]
git push -u origin [branchname]
new-branch-wd [branchname]
```
make at least one change to the new local branch, then
```
git push --set-upstream origin 552-enable-cloudwatch-for-rds
```

### Edit a draft PR
```
wd pr-template   
cp pull-request-draft.md /tmp/pr-[branch-name].md 
vim /tmp/pr-[branch-name].md
```
You will use your file in the next section

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
-R department-of-veterans-affairs/vanotify-infra \
-d \
-B master \
-H 552-enable-cloudwatch-for-rds \
-F /tmp/pr-552-enable-cloudwatch-for-rds.md \
-a ldraney \
-l devops \
-t '#552 Enable Cloudwatch for RDS'

-R department-of-veterans-affairs/notification-api \
-R department-of-veterans-affairs/notification-api-qa \
-R department-of-veterans-affairs/vanotify-infra \
```

-l github_actions \
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
