#!/bin/bash

my_dir="$( cd "$( dirname "${0}" )" && pwd )"

app_dir=${1}

image_name=cyberdojo/language_tester
docker build --build-arg app_dir=${app_dir} --tag ${image_name} ${my_dir}
if [ $? != 0 ]; then
  echo "FAILED TO BUILD ${image_name}"
  exit 1
fi
