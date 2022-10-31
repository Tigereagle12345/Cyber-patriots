#!/bin/bash/

user="${SUDO_USER:-$USER}"

home_dir="/home/$user/.bashrc"

echo -e '\nalias cypat-run="cd ~ && bash ./Cyber-patriots/ubuntu/main/ubuntu.sh"'
echo -e '\nalias cypat-aide="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/aide.sh"'
echo -e '\nalias cypat-clamav="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/clamav.sh"'
echo -e '\nalias cypat-search="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/search.sh"'
echo -e '\nalias cypat-man="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/man.sh"'
echo -e '\nalias cypat-uid="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/give.sh"'
echo "Done"
