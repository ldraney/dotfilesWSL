# NOTI
gh workflow run -r [branch] -F ref=[branch] dev_deploy.yml
gh workflow run -r [branch] -F ref=[branch] -F environment=[dev,perf,staging,prod] dev_deploy.yml
gh workflow run -r 619-adv-scanning twistlock.yml


# INFRA
gh workflow run -r [branch] -F ref=[branch] deployment.yaml
gh workflow run -r 626-twistlock -F ref=626-twistlock deployment.yaml


# QA
gh workflow run -r 96-setup -F branch=master -F environment=dev regression.yml
gh workflow run -r 96-setup -F branch=96-setup -F run_suite=dev build.yml
