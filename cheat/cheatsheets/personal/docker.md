## Kill all containers
docker kill $(sudo docker ps -q)

## force remove all containers
docker rm -f $(sudo docker ps -a -q)

# remove all images
docker rmi -f $(sudo docker images -q)

## remove all networks
docker network rm `docker network ls -q`

## delete everything #including cache
docker system prune -a

## all togerther
docker kill $(sudo docker ps -q)
docker rm -f $(sudo docker ps -a -q)
docker rmi -f $(sudo docker images -q)
docker network rm `docker network ls -q`
docker system prune -a


