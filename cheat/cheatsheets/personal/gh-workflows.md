# NOTI
gh workflow run -r [branch] -F [ref] dev_deploy.yml


# INFRA
gh workflow run -r [branch] F [ref] deployment.yml


# QA
gh workflow run -r 96-setup -F branch=master -F environment=dev regression.yml
gh workflow run -r 96-setup -F branch=96-setup -F run_suite=dev build.yml
gh workflow run -r 109-runner -F branch=109-runner -F run_suite=dev build.yml
