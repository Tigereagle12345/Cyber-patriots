#!/bin/bash/

if  [[ "$1" == "cypat-run" ]]
then
echo -e "Manual Page: cypat-run\n\nRun the main system security script. This sc>
elif [[ "$1" == "cypat-aide" ]]
then
echo -e "Manual Page: cypat-aide\n\nRuns the scripts that run aide.\nTo learn m>
elif [[ "$1" == "cypat-clamav" ]]
then
echo -e "Manual Page: cypat-clamav\n\nRuns a script that sets up and runs the C>
elif [[ "$1" == "cypat-search" ]]
then
echo -e "Manual Page: cypat-search\n\nSearches through filesystems to find file>
elif [[ "$1" == "cypat-uid" ]]
then
echo -e "Manual Page: cypat-uid\n\nGrabs the UID of a user. Run the command wit>
else
echo -e "Incorrect usage! Must include command names after 'cypat-man'. Possibl>
fi
