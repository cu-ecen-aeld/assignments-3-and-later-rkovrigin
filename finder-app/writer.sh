#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Expect 2 parameters"
    exit 1
fi

path=$1
context=$2

mkdir -p $(dirname $path)

if [ $? -ne 0 ]
then
    echo "Can't create ${path}"
    exit 1
fi

echo $context > $path

if [ $? -ne 0 ]
then
    echo "Can't write to ${path}"
    exit 1
fi

exit 0
