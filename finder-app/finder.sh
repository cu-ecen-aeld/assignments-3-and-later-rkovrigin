#!/bin/bash

if [ $# -ne 2 ]
then
    echo "Expect 2 parameters"
    exit 1
fi

if [ ! -d $1 ]
then
    echo "$1 is not a folder"
    exit 1
fi

filesdir=$1
searchstr=$2

files=$(find $filesdir -type f)

matchcount=0
filecount=0

for file in $files
do
    if [ -f $file ]
    then
        filecount=$((filecount + 1))
        tmp=$(grep "$2" $file | wc -l)
        matchcount=$((matchcount + tmp))
    fi
done


echo "The number of files are ${filecount} and the number of matching lines are ${matchcount}"

exit 0
