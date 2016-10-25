#!/bin/bash

if [ ! -f /.dockerenv ]; then
  echo 'FAILED: test_wrapper.sh is being executed outside of docker-container.'
  exit 1
fi

my_dir="$( cd "$( dirname "${0}" )" && pwd )"
test_files=(${my_dir}/*_test.rb)
ruby -e "%w( ${test_files[*]} ).shuffle.each { |file| require file }"
