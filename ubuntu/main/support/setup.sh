#!/bin/bash/

user="${SUDO_USER:-$USER}"

home_dir="/home/$user/.bashrc"
user_home="/home/$user"

echo -e "alias cypat-run='cd ~ && sudo bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh'" >> "$home_dir"
echo -e "alias cypat-aide='cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/support/aide.sh"' >> "$home_dir"
echo -e "alias cypat-clamav='cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/support/clamav.sh"' >> "$home_dir"
echo -e "alias cypat-search='d ~ && bash $user_home/Cyber-patriots/ubuntu/extraCMDs/search.sh"' >> "$home_dir"
echo -e "alias cypat-man='d ~ && bash $user_home/Cyber-patriots/ubuntu/extraCMDs/man.sh"' >> "$home_dir"
echo -e "alias cypat-uid='d ~ && bash $user_home/Cyber-patriots/ubuntu/extraCMDs/uid.sh"' >> "$home_dir"

alias cypat-run="cd ~ && sudo bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh"
alias cypat-aide="cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/support/aide.sh"
alias cypat-clamav="cd ~ && bash $user_home/Cyber-patriots/ubuntu/main/support/clamav.sh"
alias cypat-search="cd ~ && bash $user_home/Cyber-patriots/ubuntu/extraCMDs/search.sh"
alias cypat-man="cd ~ && bash $user_home/Cyber-patriots/ubuntu/extraCMDs/man.sh"
alias cypat-uid="cd ~ && bash $user_home/Cyber-patriots/ubuntu/extraCMDs/uid.sh"

echo "Done"
