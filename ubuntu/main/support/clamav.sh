#!/usr/bin/bash

/etc/init.d/clamav-freshclam stop
freshclam
/etc/init.d/clamav-freshclam start
cd ~ && echo "Current directory switched to home"
clamscan -i -r --remove=yes /
