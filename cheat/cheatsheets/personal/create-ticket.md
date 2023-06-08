## Create a ticket
### first copy the template
```
wd issue_templates
cp [template] /tmp/[template].md
vim /tmp/[template].md
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
--label 'Review Needed'
--label epic/bug/[none]
```
```
wd noti
gh issue create \
-F /tmp/terraform-utiltities-provider-upgrade.md \
--title "Utilities Provider Upgrade" \
--label Notify \
--label devops \
--label 'Review Needed' 


--assignee ldraney \

wd vanotify-infra
wd noti


#--label "epic/My Epic"
```

- message Mel if I'm interested in moving a ticket to the current sprint
