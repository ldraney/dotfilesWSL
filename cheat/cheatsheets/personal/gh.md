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
