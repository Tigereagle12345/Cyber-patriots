#!/bin/bash

cd ~/.mozilla/firefox/ || exit
touch profile_names
grep Path= profiles.ini > profile_names
sed 's/Path=//g' profile_names > profiles.txt
while IFS= read -r profile
do
  cd ~/Cyber-patriots/ubuntu/firefox/ || return
  cp user.js ~/.mozilla/firefox/"$profile"
done < profiles.txt
rm profile_names
rm profiles.txt
