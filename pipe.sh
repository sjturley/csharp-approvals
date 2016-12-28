#!/bin/bash
set -e

my_dir="$( cd "$( dirname "${0}" )" && pwd )"


# 1.
# test start-point first
# get image_name from manifest.json
# pass it to build_docker_image.sh below
image_name=cyberdojofoundation/csharp_nunit

# 2. create image
cid=$(docker run -d cyberdojo/language_tester sh -c "sleep 1d")
docker cp ${cid}:/app/src/build_docker_image.sh ${my_dir}/build_docker_image.sh
docker rm -f ${cid}
${my_dir}/build_docker_image.sh ${image_name}

# 3. test files are the colour they say claim
#- ./test_src_rags.sh

# 4. test saved output are the colour they claim
#- ./test_outputs.sh
