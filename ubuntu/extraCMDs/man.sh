#!/bin/bash/

if  [[ "$1" == "cypat-run" ]]
then
echo -e "Manual Page: cypat-run\n\nRun the main system security script. This script secures Ubuntu Server and other versions."
elif [[ "$1" == "cypat-aide" ]]
then
echo -e "Manual Page: cypat-aide\n\nRuns the scripts that run aide.\nTo learn more go to https://github.com/Tigereagle12345/Cyber-patriots"
elif [[ "$1" == "cypat-clamav" ]]
then
echo -e "Manual Page: cypat-clamav\n\nRuns a script that sets up and runs the Clamav Antivirus Program"
elif [[ "$1" == "cypat-search" ]]
then
echo -e "Manual Page: cypat-search\n\nSearches through filesystems to find files"
elif [[ "$1" == "cypat-uid" ]]
then
echo -e "Manual Page: cypat-uid\n\nGrabs the UID of a user. Run the command with a username"
else
echo -e "Incorrect usage! Must include command names after 'cypat-man'."
fi
