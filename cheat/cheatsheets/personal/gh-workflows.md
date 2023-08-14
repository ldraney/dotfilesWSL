# NOTI
gh workflow run -r [branch] -F ref=[branch] dev_deploy.yml
gh workflow run -r 619-adv-scanning twistlock.yml


# INFRA
gh workflow run -r [branch] -F [ref] deployment.yaml
gh workflow run -r 619-adv-scanning -F 619-adv-scanning deployment.yaml


# QA
gh workflow run -r 96-setup -F branch=master -F environment=dev regression.yml
gh workflow run -r 96-setup -F branch=96-setup -F run_suite=dev build.yml
gh workflow run -r 109-runner -F branch=109-runner -F run_suite=dev build.yml
