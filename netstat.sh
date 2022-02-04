#!/usr/bin/bash

echo "What would you like to do?"
echo "(1) See which proccess is using a port (2) See which port a process is using"
read -r n
if [[ "$n" = "1" ]] || [[ "$n" = "1" ]]
then
  echo "What port would you like to check?"
  read -r port
  touch netstat_results
  netstat -ano -p tcp >> netstat_results
  head -2 netstat_results
  rm netstat_results
  netstat -ano -p tcp | grep "$port"
  echo "Please input the process ID"
  read -r id
  ps -p "$id"
  echo "Do you wish to see the parent process of this process? Y/N"
  read -r yn
  if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
  then
    while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
    do
      echo "Please input the process ID"
      read -r id
      ps -e "$id"
      echo "Do you wish to see the parent process of this process? Y/N"
      read -r yn
    done
  fi
  
elif [[ "$n" = "2" ]] || [[ "$n" = "2" ]]
then
  touch pid_results
  ps -A
  echo "Please enter the process name of the process you wish to find the port of"
  read -r pn
  pgrep "$pn" > pid_results
  while IFS= read -r line
  do
   pid=${line}/
   echo "$pid"
   
  done < pid_results
  echo "hi"
  touch netstat_results
  netstat -ano -p tcp >> netstat_results
  head -2 netstat_results
  netstat -ano -p tcp | grep "$pid" || echo "Failed"
  
  rm pid_results
  rm netstat_results
fi

echo 
