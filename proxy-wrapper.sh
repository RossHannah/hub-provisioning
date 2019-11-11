#!/bin/bash

set -e

while getopts ":w:" opt; do
  case $opt in
    w) white_list="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

for var in white_list
do

    if [ -z ${!var} ]; then
        echo "Argument $var is not set" >&2
        exit 1
    fi 

done

/bin/bash ./proxy-squid.sh "${white_list}"
