docker-compose -f ci/docker-compose-local.yml build

docker-compose -f ci/docker-compose-local.yml logs --tail=100 --follow app
