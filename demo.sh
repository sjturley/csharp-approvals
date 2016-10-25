#!/bin/sh
set -e

hash docker 2> /dev/null
if [ $? != 0 ]; then
  echo
  echo "docker is not installed"
  exit 1
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - -

cd language_tester
docker-compose build
cd ..

#cd docker
#docker-compose build
#cd ..

docker_version=$(docker --version | awk '{print $3}' | sed '$s/.$//')
export DOCKER_VERSION=${docker_version}
docker-compose down
docker-compose up -d

ip=$(docker-machine ip default)
echo "${ip}:4558"
