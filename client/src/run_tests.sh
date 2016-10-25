#!/bin/bash

if [ ! -f /.dockerenv ]; then
  echo 'FAILED: test_wrapper.sh is being executed outside of docker-container.'
  exit 1
fi

test_files=(/app/src/*_test.rb)
ruby -e "%w( ${test_files[*]} ).shuffle.each { |file| require file }"
