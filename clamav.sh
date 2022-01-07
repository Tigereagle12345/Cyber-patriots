#!/usr/bin/bash

apt install clamav
freshclam
cd ~ && echo "Current directory switched to home"
mkdir Infected_Files
clamscan -r --move=Infected_Files /
