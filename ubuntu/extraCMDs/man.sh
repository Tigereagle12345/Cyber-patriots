#!/bin/bash/

if [["$1" == "cypat-run"]]
then
echo "Manual Page: cypat-run\n\nRun the main system security script. This script manages policies and can add/remove users, among other things.\nTo learn more go to https://github.com/Tigereagle12345/Cyber-patriots.git"
elif [["$1" == "cypat-aide"]]
then
echo "Manual Page: cypat-aide\n\nRuns the scripts that run aide.\nTo learn more go to https://github.com/Tigereagle12345/Cyber-patriots.git"
elif [["$1" == "cypat-clamav"]]
then
echo "Manual Page: cypat-clamav\n\nRuns a script that sets up and runs the Clamav Antivirus.\nTo learn more go to https://github.com/Tigereagle12345/Cyber-patriots.git"
elif [["$1" == "cypat-search"]]
then
echo "Manual Page: cypat-search\n\nSearches through filesystems to find files with specific file extenstions.\n\nSyntax:\n\ncypat-search [option] [location] [extension]\n\nOptions:\n\n[Option]\n-u = Search through users directory. Make sure to put username in the [location].\n-f = Search through filesystem. Make sure to put a filepath in the [location].\n\nExtention:\n\n* = List all files in a filesystem.\n.* = Replace the '*' with an extention to search for that extention.\n\nTo learn more go to https://github.com/Tigereagle12345/Cyber-patriots.git"
elif [["$1" == "cypat-uid"]]
then
echo "Manual Page: cypat-uid\n\nGrabs the UID of a user. Run the command with the user's username at the end of the command.\nTo learn more go to https://github.com/Tigereagle12345/Cyber-patriots.git"
fi
