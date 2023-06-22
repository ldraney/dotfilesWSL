

IMPORTANT NOTE - CHECK templates in infra and noti and compare to teams repo before using this again, and adjust this cheat guide as necessary.  May need to add a wd command according to the repo I'm making a ticket for




## Create a ticket
### first copy the template
```
wd issue_templates
cp [template] /tmp/[template].md
vim /tmp/[template].md
#delete the first part of the ticket (e.g. assignee) as these are used in the command
```
#### Important Reminders
* if it has the qa label should ahv echat with qa at the top

### create the issue (ticket)
```
wd [related repo]
gh issue create \
-F /tmp/template \
--title "Datadog Optimization for AWS Services" \
--assignee ldraney \
--label Notify \
--label devops \
--label 'Review Needed'
--label epic/bug/[none]
```
```
wd noti
gh issue create \
-F /tmp/qa-run-suite-pre-release.md \
--title "QA Suite - pre-release trigger" \
--label Notify \
--label devops \
--label 'Review Needed' 


--label QA
--label 'VIP'   #add this if this is a HOTFIX or urgent ticket needed to be added to sprint
--assignee ldraney \

To add a ticket to an epic, simply create it then add the appropriate epic label in the gui
--label "epic/QA Regression Suite"
```

- message Mel if I'm interested in moving a ticket to the current sprint
