#!/bin/bash/
if [["$1"=="-u"]]
then
dir = "/home/'$2'/"

elif [["$1"=="-u"]]
then
dir = "$2"

else
echo "Error: Invalid Input" && exit 1
fi

if [["$3"=="*"]]
then
ext = "*"
else
ext = "*'$3'"

find "$dir" -type f -name "'$ext'"
