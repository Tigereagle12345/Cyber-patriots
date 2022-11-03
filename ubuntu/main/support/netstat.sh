#!/usr/bin/bash

echo "What would you like to do?"
echo "(1) See which proccess is using a port (2) See which port a process is using (3) Exit"
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
  ps -q "$id" -o comm=
  cd ~ || exit
  bash ./Cyber-patriots/main/support/netstat.sh
  
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
   
  done < pid_results
  touch netstat_results
  netstat -ano -p tcp >> netstat_results
  head -2 netstat_results
  netstat -ano -p tcp | grep "$pid" || echo "Failed"
  
  rm pid_results
  rm netstat_results
  
  cd ~ || exit
  bash ./Cyber-patriots/netstat.sh


 
elif [[ "$n" = "3" ]] || [[ "$n" = "3" ]]
then
  echo "Exiting..."
  
else
   cd ~ || exit
   bash ./Cyber-patriots/ubuntu/main/support/netstat.sh
fi
