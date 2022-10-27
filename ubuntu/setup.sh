#!/bin/bash/

home_dir = "$HOME" + "/.bashrc"

echo -e '\nalias cypat-run="cd ~ && bash ./Cyber-patriots/ubuntu/main/ubuntu.sh"' >> "$home_dir"
echo -e 'alias cypat-aide="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/aide.sh"' >> "$home_dir"
echo -e 'alias cypat-clamav="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/clamav.sh"' >> "$home_dir"
echo -e 'alias cypat-search="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/search.sh"' >> "$home_dir"
echo -e 'alias cypat-man="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/man.sh"' >> "$home_dir"
echo -e 'alias cypat-uid="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/giveUID.sh"' >> "$home_dir"
echo "Done"
