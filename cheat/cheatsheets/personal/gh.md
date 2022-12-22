## running workflows
gh workflow run -F ref=[branch or commit] -F lambdaDeploy=true dev_deploy.yml -r  [branch]

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
  /repos/department-of-veterans-affairs/vanotify-infra/actions/runs
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
