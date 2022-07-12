#!/usr/bin/bash

freshclam
cd ~ && echo "Current directory switched to home"
clamscan -i -r --remove=yes /
