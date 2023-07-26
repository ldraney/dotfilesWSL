## Create a ticket
### first copy the template
new-ticket [bug, deployment, spike, story] [name]
e.g.
new-ticket bug test-ticket

### create the issue (ticket)
```
wd noti
wd qa
gh issue create \
-F /tmp/bug-test-ticket.md \
--title "Hotfix - QA EC2 partition and deploy" \
--label Notify \
--label devops \
--label QA 

--label 'Review Needed' 

--label epic/bug/[none]

--label 'VIP'   #add this if this is a HOTFIX or urgent ticket needed to be added to sprint
--assignee ldraney \

To add a ticket to an epic, simply create it then add the appropriate epic label in the gui
--label "epic/QA Regression Suite"
```

- message Mel if I'm interested in moving a ticket to the current sprint
