#!/bin/bash/

user="${SUDO_USER:-$USER}"

home_dir="/home/$user/.bashrc"

echo -e '\nalias cypat-run="cd ~ && bash ./Cyber-patriots/ubuntu/main/ubuntu.sh"' >> "$home_dir"
echo -e '\nalias cypat-aide="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/aide.sh"' >> "$home_dir"
echo -e '\nalias cypat-clamav="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/clamav.sh"' >> "$home_dir"
echo -e '\nalias cypat-search="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/search.sh"' >> "$home_dir"
echo -e '\nalias cypat-man="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/man.sh"' >> "$home_dir"
echo -e '\nalias cypat-uid="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/give.sh"' >> "$home_dir"
echo "Done"
