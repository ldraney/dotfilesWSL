## running workflows
```
gh workflow run utilities_workflow.yml \
-F ref=470-surface-metrics-datadog \
-r 470-surface-metrics-datadog
-F tf_group=utility-infrastructure \
-F on_pr=false 
```
## Making a new branch linked to an issue
```
gh issue develop \
--base master \
--checkout \
--issue-repo department-of-veterans-affairs/vanotify-infra \
--name 662-understand-datadog \
662
```

## Using the github api
### list curruent workflow runs for a repository
```
gh api \
  -H "Accept: application/vnd.github+json" \
  /repos/department-of-veterans-affairs/notification-api/actions/runs
```
```
gh api \
  -H "Accept: application/vnd.github+json" \
  /repos/department-of-veterans-affairs/vanotify-infra/tree/494-datadog-forwarder-lambda/actions/runs
```
```
$ gh api repository/{owner}/{repo}/actions/runs?ref={branch} --query '[0].head_sha' -H 'Accept: application/vnd.github+json'
```
```
gh api \
  -H "Accept: application/vnd.github+json" \
  /repos/department-of-veterans-affairs/vanotify-infra/actions/runs?ref=494-datadog-forwarder-lambda --query '[0].head_sha'
```


## working on my tickets
```
wd vanotify-team
gh issue list -a ldraney
wd notifications-api
gh issue list -a ldraney
wd vanotify-infra
gh issue list -a ldraney
```
Then
```
gh issue edit [issue]
```
