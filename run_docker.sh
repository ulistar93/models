#!/bin/bash
container_name=nifty_vaughan

if [ `docker ps -a | grep $container_name | wc -l` -lt 1 ]
then
  echo "[docker] !!! There is no \"$container_name\" container !!!"
elif [ `docker ps | grep $container_name | wc -l` -eq 1 ]
then
  echo "[docker] !!! attach \"$container_name\" container !!!"
  #docker attach $container_name
  docker exec -it $container_name /bin/bash
else
  echo "[docker] !!! Start \"$container_name\" container !!!"
  #docker start -i $container_name
  docker start $container_name
  docker exec -it $container_name /bin/bash
fi

#docker ps
#docker stop
