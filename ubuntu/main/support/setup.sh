#!/bin/bash/

user="${SUDO_USER:-$USER}"

home_dir="/home/$user/.bashrc"
user_home="/home/$user"

echo -e "alias sudo='sudo '" >> "$home_dir"

echo -e "alias cypat-run='bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh'" >> "$home_dir"
echo -e "alias cypat-aide='bash $user_home/Cyber-patriots/ubuntu/main/support/aide.sh'" >> "$home_dir"
echo -e "alias cypat-clamav='bash $user_home/Cyber-patriots/ubuntu/main/support/clamav.sh'" >> "$home_dir"
echo -e "alias cypat-search='bash $user_home/Cyber-patriots/ubuntu/extraCMDs/search.sh'" >> "$home_dir"
echo -e "alias cypat-man='bash $user_home/Cyber-patriots/ubuntu/extraCMDs/man.sh'" >> "$home_dir"
echo -e "alias cypat-uid='bash $user_home/Cyber-patriots/ubuntu/extraCMDs/uid.sh'" >> "$home_dir"

alias cypat-run="bash $user_home/Cyber-patriots/ubuntu/main/ubuntu.sh"
alias cypat-aide="bash $user_home/Cyber-patriots/ubuntu/main/support/aide.sh"
alias cypat-clamav="bash $user_home/Cyber-patriots/ubuntu/main/support/clamav.sh"
alias cypat-search="bash $user_home/Cyber-patriots/ubuntu/extraCMDs/search.sh"
alias cypat-man="bash $user_home/Cyber-patriots/ubuntu/extraCMDs/man.sh"
alias cypat-uid="bash $user_home/Cyber-patriots/ubuntu/extraCMDs/uid.sh"

echo "Done"
