#!/bin/bash

cd ~/.mozilla/firefox/
touch profile_names
grep Path= profiles.ini > profile_names
sed 's/Path=//g' profile_names > profile_names
while IFS= read -r profile
do
  cd ~/C
done < profile_names
rm profile_names
