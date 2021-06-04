#!/bin/bash
#docker run -p 80:80 --name mobinet -it od "/bin/bash"
container_name=mobinet

if [ `docker ps -a | grep $container_name | wc -l` -lt 1 ]
then
  echo "[docker] !!! There is no \"$container_name\" container !!!"
  echo "         !!! please run initially below command first"
  echo "docker run -p 80:80 --name mobinet -it od \"/bin/bash\""
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
