Quick steps:
- create pr in /tmp/pr-$1.md
```
create-pr [ticket-number]
```
- replace Fixes #__ with #[ticket-number](URL TO TICKET)
- copy zenhub ticket content 
- copy new template
- ChatGPT4 /create-pr
  - enter the appropriate values
```
wd [repo]
gh pr create \
-R department-of-veterans-affairs/notification-api-qa \
-d \
-B master \
-H 118-runner-bug \
-F /tmp/118.md \
-a ldraney \
-l devops \
-l github_actions \
-t 'runner-debug'

-l github_actions \

-R department-of-veterans-affairs/notification-api \
-R department-of-veterans-affairs/notification-api-qa \
-R department-of-veterans-affairs/vanotify-infra \
```







Read this new agreement
https://docs.google.com/document/d/1nwZIF_lydPWfvixxZlQLNt4nqy3Qp13pHQnMcYJjTqE/edit
- pick up ticket
- understand/research ticket (can include testing elsewhere)
- talk to QA - we get on the same page
- do whatever work you need to do
- if we didn't talk earlier, we absolutely need to talk before you open that PR, draft is fine
- Normally deploy branch to dev and test your branch, can't do that here > Dev Testing
- When satisfied that thing works on dev (can't do that here), open the PR > Dev Testing
- make sure my branch is updated

# Create a PR for your ticket/branch

create-pr [ticket-number]

<!--- GUI option: ** If its not a ticket and just a quick PR, then make a branch, make changes, the go to https://github.com/department-of-veterans-affairs/notification-api/branches-->
<!--```-->
<!--wd pr-template   -->
<!--cp pull-request-draft.md /tmp/pr-[branch-name].md -->
<!--vim /tmp/pr-[branch-name].md-->
<!--```-->

### edit template
- if QA is on the ticket, Don't put `Fixes #` in the description.  
- When I open a PR, the ticket should be moved to the DEV lane.
- make at least one change to the new local branch
- note* you will have to make one file change, make sure not to make/delete a testfile, cause that will close the PR!

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
e.g.
```
##  GO TO REPO, and then:
gh pr create \
-R department-of-veterans-affairs/notification-api-qa \
-d \
-B master \
-H 96-setup \
-F /tmp/pr-96.md \
-a ldraney \
-l devops \
-l github_actions \
-t '#96 Setup Env'

-R department-of-veterans-affairs/notification-api \
-R department-of-veterans-affairs/notification-api-qa \
-R department-of-veterans-affairs/vanotify-infra \
```




# Opening a PR
```
cheat open-pr.md
```
