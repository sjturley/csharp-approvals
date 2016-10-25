#!/bin/bash

hash docker 2> /dev/null
if [ $? != 0 ]; then
  echo
  echo "docker is not installed"
  exit 1
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - -

docker-compose build
docker_version=$(docker --version | awk '{print $3}' | sed '$s/.$//')
export DOCKER_VERSION=${docker_version}
docker-compose down
docker-compose up -d

# - - - - - - - - - - - - - - - - - - - - - - - - - -

cid=`docker ps --all --quiet --filter "name=language_tester"`
docker exec ${cid} sh -c "/app/src/run_tests.sh"
status=$?

# - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ ${status} != 0 ]; then
  echo
  echo "cid = ${cid}, status = ${status}"
  echo
  exit 1
else
  echo
  echo "All passed. Removing containers..."
  docker-compose down 2>/dev/null
  exit 0
fi
