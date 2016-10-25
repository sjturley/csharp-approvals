#!/bin/bash

./demo.sh

cid=`docker ps --all --quiet --filter "name=runner_client"`
docker exec ${cid} sh -c "/app/src/run_tests.sh"
status=$?

# - - - - - - - - - - - - - - - - - - - - - - - - - -

if [ ${status} != 0 ]; then
  echo
  echo "cid = ${cid}, status = ${status}"
  echo
  docker ps -a
  exit 1
else
  echo
  echo "All passed. Removing containers..."
  docker-compose down 2>/dev/null
  exit 0
fi
