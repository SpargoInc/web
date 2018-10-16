#!/bin/bash

if [ -d /spargo/scripts ]
then
  echo Running scripts in scripts directory
  chmod 555 /spargo/scripts/*.sh
  for filename in /spargo/scripts/*.sh; do
    eval "$filename"
  done
fi

# Run Apache HTTPD
httpd -DFOREGROUND