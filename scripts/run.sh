#!/bin/bash -e

if [ -d /spargo/scripts ]
then
  echo Running scripts in scripts directory
  chmod 555 /spargo/scripts/*.sh
  files=`ls /spargo/scripts/*.sh | grep -v /spargo/scripts/00-`
  for filename in $files; do
    echo "========================"
    echo "==== RUN $filename"
    eval "$filename"
  done
fi

# Run Apache HTTPD
httpd -DFOREGROUND