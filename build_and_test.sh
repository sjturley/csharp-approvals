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

cd docker
docker-compose build
cd ..


#cid=`docker ps --all --quiet --filter "name=runner_client"`
#docker exec ${cid} sh -c "/app/src/run_tests.sh"
#status=$?
