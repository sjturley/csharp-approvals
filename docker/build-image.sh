#!/bin/bash

my_dir="$( cd "$( dirname "${0}" )" && pwd )"

docker build \
  --file ${my_dir}/Dockerfile \
  --tag cyberdojofoundation/csharp_nunit \
  ${my_dir}
