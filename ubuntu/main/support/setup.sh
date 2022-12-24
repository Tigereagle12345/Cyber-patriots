#!/bin/bash/

user="${SUDO_USER:-$USER}"

home_dir="/home/$user/.bashrc"
user_home="/home/$user/

echo -e '\nalias cypat-run="cd ~ && sudo bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh"' >> "$home_dir"
echo -e '\nalias cypat-aide="cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh"' >> "$home_dir"
echo -e '\nalias cypat-clamav="cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh"' >> "$home_dir"
echo -e '\nalias cypat-search="cd ~ && bash $user_home/Cyber-patriots/ubuntu/extraCMDs/search.sh"' >> "$home_dir"
echo -e '\nalias cypat-man="cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh"' >> "$home_dir"
echo -e '\nalias cypat-uid="cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh"' >> "$home_dir"

alias cypat-run="cd ~ && sudo bash ./Cyber-patriots/ubuntu/main/ubuntu.sh"
alias cypat-aide="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/aide.sh"
alias cypat-clamav="cd ~ && bash ./Cyber-patriots/ubuntu/main/support/clamav.sh"
alias cypat-search="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/search.sh"
alias cypat-man="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/man.sh"
alias cypat-uid="cd ~ && bash ./Cyber-patriots/ubuntu/extraCMDs/give.sh"

echo "Done"
