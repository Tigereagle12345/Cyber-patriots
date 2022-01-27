#!/usr/bin/bash

echo "What would you like to do?"
echo "(1) See which proccess is using a port (2) See which port a process is using"
read -p n
if [ "$n" = "1"]
then
  echo "What port would you like to check?"
  read -p port
  netstat -ano -p tcp | grep $port
  
