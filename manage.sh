#!/bin/bash

if [ "$1" == "zip" ]; then
  tar -czvf src_archive.tar.gz src/
elif [ "$1" == "unzip" ]; then
  tar -xzvf updated_src_archive.tar.gz
else
  echo "Usage: ./manage.sh [zip|unzip]"
fi
