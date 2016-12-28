#!/bin/bash

my_dir="$( cd "$( dirname "${0}" )" && pwd )"

docker run \
  --rm \
  cyberdojo/language_tester \
  sh -c "cat /app/src/bootstrap.sh" | tr -d '\r' > /tmp/bootstrap.sh

chmod +x /tmp/bootstrap.sh
/tmp/bootstrap.sh ${my_dir}
status=$?
rm /tmp/bootstrap.sh
exit ${status}
