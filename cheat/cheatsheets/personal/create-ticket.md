start-ticket [bug, deployment, spike, story] [name]
- edit template as needed
create-ticket [ticket name] [wd branch] [ticket title]
  *THIS ISNT QUITE WORKING YET, it overwrite the tmp file with the tempalte!*
  e.g. 
  create-ticket ec2-vaec noti "QA EC2 VA_SLICE"















```
output=$( \
gh issue create \
-F /tmp/docker-password.md \
--title "Docker Password error" \
--label Notify \
--label devops \
--label bug \
--label 'VIP' \
--label 'Review Needed'  \
);
issue_url=$(echo "$output" | grep -oE 'https://github.com/[^ ]+');
open_zenhub_issue "$issue_url"
```
















## Create a ticket
### first copy the template
create-ticket [bug, deployment, spike, story] [name]
e.g.
create-ticket bug test-ticket

### create the issue (ticket)
```
wd noti
wd qa
output=$( \
gh issue create \
-F /tmp/docker-password.md \
--title "Docker Password error" \
--label Notify \
--label devops \
--label bug \
--label 'VIP' \
--label 'Review Needed'  \
);

issue_url=$(echo "$output" | grep -oE 'https://github.com/[^ ]+');

open_zenhub_issue "$issue_url"
```


--label epic/bug/[none]
--label QA \

--label 'VIP'   #add this if this is a HOTFIX or urgent ticket needed to be added to sprint
--assignee ldraney \

To add a ticket to an epic, simply create it then add the appropriate epic label in the gui
--label "epic/QA Regression Suite"
```

- message Mel if I'm interested in moving a ticket to the current sprint

<!--output=$(gh issue create -F /tmp/docker-password.md --title "Docker Password error" --label Notify --label devops --label bug --label 'VIP' --label 'Review Needed'); issue_url=$(echo "$output" | grep -oE 'https://github.com/[^ ]+'); open_zenhub_issue "$issue_url"-->
