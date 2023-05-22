## Delete one image
sudo docker image rm notification_api

## Kill all containers
sudo docker kill $(sudo docker ps -q)

## force remove all containers
sudo docker rm -f $(sudo docker ps -a -q)

# remove all images
sudo docker rmi -f $(sudo docker images -q)

## remove all networks
sudo docker network rm `docker network ls -q`

## delete everything #including cache
sudo docker system prune -a
