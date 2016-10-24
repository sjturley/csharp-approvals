#!/bin/bash

hash docker 2> /dev/null
if [ $? != 0 ]; then
  echo
  echo "docker is not installed"
  exit 1
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - -

my_dir="$( cd "$( dirname "${0}" )" && pwd )"
app_dir=/app

${my_dir}/client/build-image.sh ${app_dir}

# - - - - - - - - - - - - - - - - - - - - - - - - - -

docker_version=$(docker --version | awk '{print $3}' | sed '$s/.$//')
server_port=4557

cat ${my_dir}/docker-compose.yml.PORT |
  sed "s/DOCKER_ENGINE_VERSION/${docker_version}/g" |
  sed "s/SERVER_PORT/${server_port}/g" > ${my_dir}/docker-compose.yml

docker-compose down
docker-compose up -d

# - - - - - - - - - - - - - - - - - - - - - - - - - -

server_cid=`docker ps --all --quiet --filter "name=csharp-nunit-tester"`
docker exec ${server_cid} sh -c "cd src && ruby ./traffic_lights_test.rb"
server_exit_status=$?

# - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ ${server_exit_status} != 0 ]; then
  echo
  echo "server: cid = ${server_cid}, exit_status = ${server_exit_status}"
  echo
  exit 1
else
  echo
  echo "All passed. Removing containers..."
  docker-compose down 2>/dev/null
  exit 0
fi
