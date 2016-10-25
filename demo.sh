#!/bin/sh
set -e

docker-compose build
docker_version=$(docker --version | awk '{print $3}' | sed '$s/.$//')
export DOCKER_VERSION=${docker_version}
docker-compose down
docker-compose up -d

ip=$(docker-machine ip default)
echo "${ip}:4568"
