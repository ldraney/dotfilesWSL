## quickly make a new script command for current workflow
Add something like the following to ~/.zshrc:
```
function retry-profiler(){
  docker-compose -f ci/docker-compose-local.yml down
  docker image rm ci_datadog-agent
  docker image rm notification_api
  docker-compose -f ci/docker-compose-local.yml build
  docker-compose -f ci/docker-compose-local.yml up
}
```
