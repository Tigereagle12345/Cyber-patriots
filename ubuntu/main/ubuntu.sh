#!/usr/bin/bash

##############################################

# Tigereagle12345's Cyber Patriot Script -Ubuntu Linux-
#
# IMPORTANT:
#
# FOR USE OF TEAM 14-4347 ONLY!!!
#
# Note:
#
# This script was designed to be run as an administrator on Ubuntu Linux and may not work if not run this way
# The default password for the script (The one it sets passwords as) is q^yRpNgbes2wM*xR

banner="
###################################################################################################

 _________    __    __    ______      _______     ______                  
|    _____|   \ \  / /   |      |    |   ____|   |      |         
|   |          \ \/ /    |  []   |   |  |___     |  []  |         
|   |           |  |     |      |    |   ___|    |      |         
|   |_____      |  |     |  []   |   |  |____    |  |\  \         
|_________|     |__|     |______|    |_______|   |__| \__\        

 ______        ____         __________     ______       __      ______      __________
|      |      /    \       |___    ___|   |      |     |  |    /  __  \    |___    ___|
|  []  |     /  []  \          |  |       |  []  |     |  |   |  |  |  |       |  |
|   ___|    /   __   \         |  |       |      |     |  |   |  |  |  |       |  |
|  |       /   /  \   \        |  |       |  |\  \     |  |   |  |__|  |       |  |
|__|      /___/    \___\       |__|       |__| \__\    |__|    \______/        |__|

 __________     _______         ____         __          __
|___    ___|   |   ____|       /    \       |  \        /  |
    |  |       |  |___        /  []  \      | | \      / | |
    |  |       |   ___|      /   __   \     | |\ \    / /| |
    |  |       |  |____     /   /  \   \    | | \ \__/ / | |
    |__|       |_______|   /___/    \___\   |_|  \____/  |_|

 ___     ___     _______     ___     ___      _________
|   |   |   |   |____   |   |   |   |   |    |_____    /
|   |___|   |    ____|  |   |   |___|   |         /   /
|_______    |   |____   |   |_______    |        /   /
        |   |    ____|  |           |   |       /   /
        |___|   |_______|           |___|      /___/

###################################################################################################
"

##############################################

# Functions

secure_pass() {
apt install libpam-cracklib
cp /etc/pam.d/common-password /root/


pass_len
pass_age
pass_history
pass_complex
#pass_lockout
pass_encrypt
}

pass_len() {
# Sets a minimum password length of 14 characters
  awk '{if (/ sha512/) {$0=$0 " minlen=14"}; print}' /etc/pam.d/common-password > pass_len_config
  cp pass_len_config /etc/pam.d/common-password
  rm pass_len_config
  echo "Minimum Password Length Set to 14 characters"
}

pass_age() {
# Sets a maximum password age
  awk '{if($2=="99999") {$2="   30"} print $0}' /etc/login.defs > pass_age_config
  cp pass_age_config /etc/login.defs
  rm pass_age_config
  echo "Maximum Password Age Set to 30 days"
}

pass_history() {
# Sets a minimum password history of 5 passwords, preventing password reuse
  awk '{if (/ minlen=14/) {$0=$0 " remember=5"}; print}' /etc/pam.d/common-password > pass_history_config
  cp pass_history_config /etc/pam.d/common-password
  rm pass_history_config
  echo "Minimum Password History set to 5 Passwords"
}

pass_complex() {
# Sets password complexity standards
awk '{if (/ authtok/) {$0=$0 " ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1"}; print}' /etc/pam.d/common-password > pass_complex_config
cp pass_complex_config /etc/pam.d/common-password
rm pass_complex_config
echo "Password Complexity Standards set to at least 1 of each character"
}

pass_encrypt() {
# Sets the password encryption to be sha512
awk '{if (/ remember=5/) {$0=$0 " sha512"}; print}' /etc/pam.d/common-password > pass_encrypt_config
cp pass_encrypt_config /etc/pam.d/common-password
rm pass_encrypt_config
echo "Password Encryption Set to sha512"

# Ensure all passwords are encrypted
sed -e 's/^\([a-zA-Z0-9_]*\):[^:]*:/\1:x:/' -i /etc/passwd
}

pass_lockout() {
# Sets a Password Lockout policy of 5 tries and 30 minutes lockout
cp -v ./support/pass_lockout_conf.txt /etc/pam.d/common-auth
echo "Password Lockout set to 5 tries and 30 minutes lockout"
}

secure_sysctl() {
# Enable Bad Error Message Protection

awk '{if($2=="#net.ipv4.ip_forward=1") {$2="net.ipv4.ip_forward=0"} print $0}' /etc/sysctl.conf > sysctl_conf
cp sysctl_conf /etc/sysctl.conf
echo "Bad Error Message Protection Enabled"

# Enable SYN cookies to ensure a server avoids dropping connections when the SYN queue fills up
awk '{if($2=="#net.ipv4.conf.all.send_redirects = 0
") {$2="net.ipv4.conf.all.send_redirects = 0
"} print $0}' /etc/sysctl.conf > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

awk 'NR==3{print "net.ipv4.conf.default.send_redirects = 0
"}1' /etc/sysctl.conf > sysctl_conf
cp sysctl_conf /etc/sysctl.conf
echo "SYN cookies to ensure a server avoids dropping connections when the SYN queue fills up Enabled"

# Increase the SYS backlog queue size to 2048
awk '{if($2=="#net.ipv4.conf.all.accept_redirects = 0
") {$2="net.ipv4.conf.all.accept_redirects = 0
"} print $0}' /etc/sysctl.conf > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

awk 'NR==3{print "net.ipv4.conf.default.accept_redirects = 0
"}1' /etc/sysctl.conf > sysctl_conf
cp sysctl_conf /etc/sysctl.conf
echo "SYS backlog queue size increased to 2048"

# Lowers the timeout value for SYN_RECV to help in reducing the SYN flood attack

(cat /etc/sysctl.conf ; echo "net.ipv4.icmp_ignore_bogus_error_responses = 1") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.tcp_syncookies = 1") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.tcp_max_syn_backlog = 2048") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.tcp_synack_retries = 3") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.netfilter.ip_conntrack_tcp_timeout_syn_recv=45") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

echo "Timeout value for SYN_RECV to help in reducing the SYN flood attack lowered"

(cat /etc/sysctl.conf ; echo "net.ipv4.conf.all.send_redirects = 0") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.conf.default.send_redirects = 0") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.conf.all.accept_source_route = 0") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.conf.default.accept_source_route = 0") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf
(cat /etc/sysctl.conf ; echo "net.ipv4.conf.all.rp_filter = 1") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.conf.default.rp_filter = 1") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.tcp_syncookies = 1") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv6.conf.all.accept_ra = 0") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv6.conf.all.accept_ra = 0") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

rm sysctl_conf

# Reloads the configuration issue
sysctl -p

sysctl -w net.ipv4.conf.all.send_redirects=0
sysctl -w net.ipv4.conf.default.send_redirects=0
sysctl -w net.ipv4.route.flush=1 

sysctl -w net.ipv4.conf.all.accept_source_route=0 
sysctl -w net.ipv4.conf.default.accept_source_route=0 
sysctl -w net.ipv4.route.flush=1 

sysctl -w net.ipv4.conf.all.rp_filter=1 
sysctl -w net.ipv4.conf.default.rp_filter=1 
sysctl -w net.ipv4.route.flush=1

sysctl -w net.ipv4.tcp_syncookies=1 
sysctl -w net.ipv4.route.flush=1 

sysctl -w net.ipv6.conf.all.accept_ra=0
sysctl -w net.ipv6.conf.default.accept_ra=0
sysctl -w net.ipv6.route.flush=1

# Disables IP Forwarding
grep -Els "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf | while read -r filename; do sed -ri "s/^\s*(net\.ipv4\.ip_forward\s*)(=)(\s*\S+\b).*$/# *REMOVED* \1/" "$filename"; done; sysctl -w net.ipv4.ip_forward=0; sysctl -w net.ipv4.route.flush=1 

echo "IP Forwarding Disabled"

# Disables ipv6
awk '/GRUB_CMDLINE_LINUX/ {print;print "GRUB_CMDLINE_LINUX="ipv6.disable=1"";next}1' /etc/default/grub > ip_conf
cp ip_conf /etc/default/grub
rm ip_conf

update-grub

# Makes sure suspicious packets are logged
log_sus_packets
echo "Logging of Suspicious Packets Enabled"

echo "Sysctl Configured"
}

enable_ufw() {
# Installs, configures and enables the Linux firewall
apt install ufw -y
apt purge iptables-persistent -y

# Enables UFW
ufw enable

# Configures ufw loopback traffic
ufw allow in on lo 
ufw allow out on lo 
ufw deny in from 127.0.0.0/8 # ufw deny in from ::1

ufw allow in http
ufw allow in https

ufw logging on
ufw logging full
ufw status
ufw status verbose
echo "Firewall Enabled"
}

enable_audit() {
# Enables Audits without AuditD
auditctl -e 1

# Installs auditd
apt install auditd -y
apt install auditd audispd-plugins -y
  
# Configures Auditd Settings
awk '/GRUB_CMDLINE_LINUX/ {print;print "GRUB_CMDLINE_LINUX="audit=1"";next}1' /etc/default/grub > auditd_conf
cp auditd_conf /etc/default/grub
rm auditd_conf

awk '/GRUB_CMDLINE_LINUX/ {print;print "GRUB_CMDLINE_LINUX="audit_backlog_limit=8192"";next}1' /etc/default/grub > auditd_conf
cp auditd_conf /etc/default/grub
rm auditd_conf

update-grub

(cat /etc/audit/auditd.conf ; echo "max_log_file = 500") > auditd_conf
cp auditd_conf /etc/audit/auditd.conf
rm auditd_conf

(cat /etc/audit/auditd.conf ; echo "max_log_file_action = keep_logs") > auditd_conf
cp auditd_conf /etc/audit/auditd.conf
rm auditd_conf

(cat /etc/audit/auditd.conf ; echo "space_left_action = email") > auditd_conf
cp auditd_conf /etc/audit/auditd.conf
rm auditd_conf

(cat /etc/audit/auditd.conf ; echo "action_mail_acct = root") > auditd_conf
cp auditd_conf /etc/audit/auditd.conf
rm auditd_conf

(cat /etc/audit/auditd.conf ; echo "admin_space_left_action = halt") > auditd_conf
cp auditd_conf /etc/audit/auditd.conf
rm auditd_conf

(cat /etc/audit/rules.d/50-identity.rules ; echo "-w /etc/group -p wa -k identity 
-w /etc/passwd -p wa -k identity 
-w /etc/gshadow -p wa -k identity 
-w /etc/shadow -p wa -k identity 
-w /etc/security/opasswd -p wa -k identity") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-identity.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-system-locale.rules ; echo "-a always,exit -F arch=b64 -S sethostname -S setdomainname -k system-locale 
-a always,exit -F arch=b32 -S sethostname -S setdomainname -k system-locale 
-w /etc/issue -p wa -k system-locale 
-w /etc/issue.net -p wa -k system-locale 
-w /etc/hosts -p wa -k system-locale 
-w /etc/network -p wa -k system-locale") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-system-locale.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-logins.rules ; echo "-w /var/log/faillog -p wa -k logins 
-w /var/log/lastlog -p wa -k logins 
-w /var/log/tallylog -p wa -k logins") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-logins.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-session.rules ; echo "-w /var/run/utmp -p wa -k session 
-w /var/log/wtmp -p wa -k logins 
-w /var/log/btmp -p wa -k logins") > auditd_conf
cp auditd_conf  /etc/audit/rules.d/50-session.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-MAC-policy.rules ; echo "-w /etc/apparmor/ -p wa -k MAC-policy
-w /etc/apparmor.d/ -p wa -k MAC-policy") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-MAC-policy.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-perm_mod.rules ; echo "-a always,exit -F arch=b64 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod 
-a always,exit -F arch=b32 -S chmod -S fchmod -S fchmodat -F auid>=1000 -F auid!=4294967295 -k perm_mod 
-a always,exit -F arch=b64 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 -k perm_mod 
-a always,exit -F arch=b32 -S chown -S fchown -S fchownat -S lchown -F auid>=1000 -F auid!=4294967295 
-k perm_mod -a always,exit -F arch=b64 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 
-k perm_mod 
-a always,exit -F arch=b32 -S setxattr -S lsetxattr -S fsetxattr -S removexattr -S lremovexattr -S fremovexattr -F auid>=1000 -F auid!=4294967295 
-k perm_mod") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-perm_mod.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-access.rules ; echo "-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access 
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EACCES -F auid>=1000 -F auid!=4294967295 -k access 
-a always,exit -F arch=b64 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access 
-a always,exit -F arch=b32 -S creat -S open -S openat -S truncate -S ftruncate -F exit=-EPERM -F auid>=1000 -F auid!=4294967295 -k access") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-access.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-mounts.rules ; echo "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts 
-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=4294967295 -k mounts") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-mounts.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-delete.rules ; echo "-a always,exit -F arch=b64 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete 
-a always,exit -F arch=b32 -S unlink -S unlinkat -S rename -S renameat -F auid>=1000 -F auid!=4294967295 -k delete") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-delete.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-scope.rules ; echo "-w /etc/sudoers -p wa -k scope 
-w /etc/sudoers.d/ -p wa -k scope") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-scope.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-action.rules ; echo "-a always,exit -F arch=b64 -C euid!=uid -F euid=0 -Fauid>=1000 -F auid!=4294967295 -S execve -k actions 
-a always,exit -F arch=b32 -C euid!=uid -F euid=0 -Fauid>=1000 -F auid!=4294967295 -S execve -k actions") > auditd_conf
cp auditd_conf /etc/audit/rules.d/50-action.rules
rm auditd_conf

(cat /etc/audit/rules.d/50-module.rules ; echo "-w /sbin/insmod -p x -k modules 
-w /sbin/rmmod -p x -k modules 
-w /sbin/modprobe -p x -k modules 
-a always,exit -F arch=b64 -S init_module -S delete_module -k modules") > auditd_conf
cp auditd_conf  /etc/audit/rules.d/50-module.rules
rm auditd_conf

# Configures a log file for sudo
touch sudo_log
sudo_log="sudo_log"
(cat /etc/sudodoers ; echo "Defaults logfile=$sudo_log") > sudo_conf
cp sudo_conf /etc/sudodoers
rm sudo_conf

(cat /etc/audit/rules.d/99-finalize.rules ; echo "-e 2") > auditd_conf
cp auditd_conf  /etc/audit/rules.d/99-finalize.rules
rm auditd_conf

# Enables auditd
  systemctl --now enable auditd
  systemctl enable auditd
  auditctl –e 1 > audit_log
  service auditd start
  echo "Audit Enabled"
  echo "Find Audits in the audit_log file"
  echo "Find Sudo Logs in the sudo_log file"
  proceed
}

rsyslog() {
# Installs Rsyslog, a logging tool
apt install rsyslog -y

# Enables Rsyslog
systemctl --now enable rsyslog

echo "Rsyslog Installed and enabled"
}

crontab_conf() {
systemctl --now enable cron
chown root:root /etc/crontab 
chmod og-rwx /etc/crontab

chown root:root /etc/cron.hourly/ 
chmod og-rwx /etc/cron.hourly/ 

chown root:root /etc/cron.daily/ 
chmod og-rwx /etc/cron.daily/

chown root:root /etc/cron.monthly/ 
chmod og-rwx /etc/cron.monthly/ 

chown root:root /etc/cron.d/ 
chmod og-rwx /etc/cron.d/

rm /etc/cron.deny
touch /etc/cron.allow
chmod g-wx,o-rwx /etc/cron.allow 
chown root:root /etc/cron.allow

echo "Cron Permissions Configured"
}

permissions() {
rm /etc/at.deny
touch /etc/at.allow
chmod g-wx,o-rwx /etc/at.allow
chown root:root /etc/at.allow

# Configures permissions for /etc/passwd file
chown root:root /etc/passwd
chmod u-x,go-wx /etc/passwd

# Configures permissions for /etc/passwd- file
chown root:root /etc/passwd-
chmod u-x,go-wx /etc/passwd-

# Configures permissions for /etc/group file
chown root:root /etc/group
chmod u-x,go-wx /etc/group

# Configures permissions for /etc/group- file
chown root:root /etc/group-
chmod u-x,go-wx /etc/group-

# Configures permissions for /etc/shadow file
chmod u-x,g-wx,o-rwx /etc/shadow


# Configures permissions for /etc/shadow- file
chmod u-x,g-wx,o-rwx /etc/shadow-

# Configures permissions for /etc/gshadow file
chmod u-x,g-wx,o-rwx /etc/gshadow

# Configures permissions for /etc/gshadow- file
chmod u-x,g-wx,o-rwx /etc/gshadow-

# Configures permissions for the shadow group
sed -ri 's/(^shadow:[^:]*:[^:]*:)([^:]+$)/\1/' /etc/group

# Disables USB's
(cat /etc/modprobe.d/usb_storage.conf ; echo "install usb-storage /bin/true") > usb_conf
cp usb_conf /etc/modprobe.d/usb_storage.conf
rm usb_conf

rmmod usb-storage

chown 000 /media/

# Configures sudo account permissions
(cat /etcsudodoers/ ; echo "Defaults use_pty") > sudo_conf
cp sudo_conf /etc/sudodoers
rm sudo_conf

# Configures use of su command
groupadd sugroup
(cat /etc/pam.d/su ; echo "auth required pam_wheel.so use_uid group=sugroup") > su_conf
cp su_conf /etc/sudodoers
rm su_conf

# Configures root account permissions
passwd -l root
usermod -g 0 root
}

fail2ban() {
# Installs and enables fail2ban
  apt install fail2ban -y
  cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
  service fail2ban restart
  chkconfig --level 345 fail2ban on
  echo "Fail2ban Enabled"
}

daily_updates() {
# Creates a daily crontab to run updates
  daily_updates="@daily apt update -y; apt upgrade -y; apt dist-upgrade -y; apt-get update -y; apt-get install firefox -y; apt-get linux-image-generic -y; clamav > clamav_scan_results"
  touch daily_updates
  echo "$daily_updates" #>> daily_updates
  crontab daily_updates
  rm daily_updates
  apt-get install unattended-upgrades -y
  dpkg-reconfigure -plow unattended-upgrades
  echo "Daily Updates Added"
}

secure_ssh() {
# Secure SSH Server
echo "Will others be connecting to this device via SSH? Y/N"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  if [[ ! ${SSH_TTY} ]]
  then
    awk '{if($2=="#   Protocol 2,1") {$2="Protocol 2"} print $0}' /etc/ssh/ssh_config > ssh_conf
    cp ssh_conf /etc/ssh/ssh_config
   
    awk '{if($2=="#   Protocol 2,1") {$2="Protocol 2"} print $0}' /etc/ssh/sshd_config > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    awk '{if($2=="LoginGraceTime 600") {$2="LoginGraceTime 60"} print $0}' /etc/ssh/sshd_config > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    awk '{if($2=="PermitRootLogin yes") {$2="PermitRootLogin no"} print $0}' /etc/ssh/sshd_config > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    awk '{if($2=="#Port 22") {$2="Port 26"} print $0}' /etc/ssh/sshd_config > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    (cat  /etc/ssh/sshd_config ; echo "LogLevel VERBOSE") > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    (cat  /etc/ssh/sshd_config ; echo "X11Forwarding no") > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    (cat  /etc/ssh/sshd_config ; echo "MaxAuthTries 4") > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    (cat  /etc/ssh/sshd_config ; echo "IgnoreRhosts yes") > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    (cat  /etc/ssh/sshd_config ; echo "HostbasedAuthentication no") > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    (cat  /etc/ssh/sshd_config ; echo "PermitEmptyPasswords no") > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config
  
    (cat  /etc/ssh/sshd_config ; echo "PermitUserEnvironment no") > ssh_conf
    cp ssh_conf /etc/ssh/sshd_config

    /etc/init.d/ssh restart
  
    ufw allow ssh
    ufw allow 22

    rm ssh_conf

    service sshd reload

    chown root:root /etc/ssh/sshd_config
    chmod og-rwx /etc/ssh/sshd_config

    find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chown root:root {} \;
    find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod u-x,go-rwx {} \; 

    find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chmod u-x,gowx {} \; 
    find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec chown root:root {} \; 

    echo "Generating SSH Key"
    ssh-keygen -f ssh_key -t ecdsa -b 521 -N q^yRpNgbes2wM*xR
    chmod go-rwx,u-wx ssh_key
    echo "SSH Key Generated"
    echo "SSH Key stored in ssh_key"
    echo "SSH Key access allowed only to owner"
    echo "SSH Key passphrase is the default script password"
    proceed
  fi
fi
}

add_remove() {
group="$1"
echo "Do you want to add or remove anyone from this group?"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  echo "Add or Remove from this group? add/delete (Make sure to type answer in lower-case!)"
  read -r add_delete
  if [[ "$add_delete" = "add" ]] || [[ "$add_delete" = "Add" ]]
  then
    echo "Who would like to add?"
    read -r add
    usermod -a -G "$group" "$add"
    echo "User $add added to $group"
    echo "Would you like to add anyone else?"
    read -r yn
    if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
    then 
      while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
      do
        echo "Who would like to add?"
        read -r add
        usermod -a -G "$group" "$add"
        echo "User $add added to $group"
        echo "Would you like to add anyone else?"
        read -r yn
      done
    elif [[ "$add_delete" = "delete" ]] || [[ "$add_delete" = "Delete" ]]
    then
     echo "Who would like to remove?"
     read -r delete
     usermod -a -G "$group" "$delete"
     echo "User $delete removed from $group"
     echo "Would you like to remove anyone else?"
     read -r yn
     if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
     then 
       while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
       do
         echo "Who would like to delete?"
         read -r delete
         usermod -a -G "$group" "$delete"
         echo "User $delete removed from $group"
         echo "Would you like to remove anyone else?"
         read -r yn
    fi
  fi
  
else
  if [[ "$add_delete" = "delete" ]] || [[ "$add_delete" = "Delete" ]]
  then
    echo "Who would like to remove?"
    read -r delete
    gpasswd -d "$delete" "$group"
    echo "User $delete removed from $group"
    echo "Would you like to remove anyone else?"
    read -r yn
    if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
    then 
      while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
      do
        echo "Who would like to remove?"
        read -r delete
        gpasswd -d "$delete" "$group"
        echo "User $delete removed from $group"
        echo "Would you like to remove anyone else?"
        read -r yn
      done
    fi
  fi
fi
}

change_groups() {
# Add or remove users in the administrators group
group="adm"
members "$group"
echo "This is the admin group"
add_remove "$group"

# Add or remove users in the sudo group
group="sudo"
members "$group"
echo "This is the sudo users group"
add_remove "$group"

#Add or remove users in other groups
cat /etc/group
echo "Would you like to edit another group?"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
  do
    echo "What group would you like to edit?"
    read -r group_to_edit
    group="$group_to_edit"
    members "$group"
    echo "This is the $group users group"
    add_remove "$group"
    echo "Would you like to edit another group?"
    read -r yn
  done
fi
}

disable_mounting() {
# Disables mounting of filesystems
{
echo "install cramfs /bin/true"
"install freevxfs /bin/true"
"install jffs2 /bin/true"
"install hfs /bin/true"
"install hfsplus /bin/true"
"install squashfs /bin/true"
"install udf /bin/true"
"install vfat /bin/true"
} >> filesystems_conf
cp filesystems_conf /etc/modprobe.d/CIS.conf
rm filesystems_conf

rmmod cramfs
rmmod freevxfs
rmmod jffs2
rmmod hfs
rmmod hfsplus
rmmod squashfs
rmmod udf
rmmod vfat

cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/

(cat  /etc/systemd/system/tmp.mount ; echo " [Mount] 
What=tmpfs 
Where=/tmp 
Type=tmpfs 
Options=mode=1777,strictatime,nosuid,nodev,noexec") > tmp_mount_conf
cp tmp_mount_conf /etc/systemd/system/tmp.mount
rm tmp_mount_conf
systemctl daemon-reload
systemctl --now enable tmp.mount 

systemctl --now disable autofs

  echo "Mounting Disabled"
}

sticky_bit() {
 df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs -I '{}' chmod a+t '{}' 
}

conf_lightdm() {
(cat /etc/lightdm/lightdm.conf ; echo "allow-guest=false") > lightdm_conf
cp lightdml_conf /etc/lightdm/lightdm.conf

rm lightdm_conf

echo "LightDM Configured"

}

proceed() {
echo "Press enter to proceed"
read -r p
if [[ "$p" = "$p" ]]
then
  echo "Proceeding"
fi
}

aide() {
apt install aide aide-common -y
echo "Run Aide in a different window by running command: cypat-aide"
proceed
}

boot() {
sed -ri "s/chmod\s+[0-7][0-7][0-7]\s+\$\{grub_cfg\}\.new/chmod 400 $(grub_cfg).new/" /usr/sbin/grub-mkconfig

sed -ri 's/ && ! grep "\^password" \$\{grub_cfg\}.new >\/dev\/null//' /usr/sbin/grub-mkconfig 

chown root:root /boot/grub/grub.cfg 
chmod u-wx,go-rwx /boot/grub/grub.cfg 

}

aslr() {
(cat /etc/sysctl.conf ; echo "kernel.randomize_va_space = 2") > aslr_conf
cp aslr_conf /etc/sysctl.conf
rm aslr_conf

for file in /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /run/sysctl.d/*.conf; do 
  if [ -f "$file" ]; then
    grep -Esq "^\s*kernel\.randomize_va_space\s*=\s*([0-1]|[3-9]|[1-9][0-   9]+)" "$file" && sed -ri 's/^\s*kernel\.randomize_va_space\s*=\s*([0-1]|[3- 9]|[1-9][0-9]+)/# &/gi' "$file"
  fi 
done 

sysctl -w kernel.randomize_va_space=2
}

core_dump() {
(cat /etc/security/limits.conf ; echo "* hard core 0") > core_dump_conf
cp core_dump_conf /etc/security/limits.conf 
rm core_dump_conf

(cat /etc/security/limits.conf ; echo "fs.suid_dumpable = 0") > core_dump_conf
cp core_dump_conf /etc/security/limits.conf 
rm core_dump_conf

sysctl -w fs.suid_dumpable=0

echo "Checking if Core Dump is installed…"
systemctl is-enabled coredump.service
echo "Was the previous output either enabled, masked or disabled? y/n"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  (cat /etc/systemd/coredump.conf ; echo "Storage=none") > core_dump_conf
  cp core_dump_conf  /etc/systemd/coredump.conf
  rm core_dump_conf

  (cat /etc/systemd/coredump.conf ; echo "ProcessSizeMax=0") > core_dump_conf
  cp core_dump_conf  /etc/systemd/coredump.conf
  rm core_dump_conf

  systemctl daemon-reload
fi
}

app_armour() {
apt install apparmor -y
apt install apparmor-utils -y
aa-enforce /etc/apparmor.d/usr.bin.*

awk '/GRUB_CMDLINE_LINUX/ {print;print "GRUB_CMDLINE_LINUX="apparmor=1 security=apparmor"";next}1' /etc/default/grub > app_armour_conf
cp app_armour_conf /etc/default/grub
rm app_armour_conf

update-grub

aa-enforce /etc/apparmor.d/usr.bin.*
}

gui() {
# Disables Username list on startup
(cat /etc/gdm3/greeter.dconf-defaults ; echo " [org/gnome/login-screen]

banner-message-enable=true 
banner-message-text= 'User List Diabled'
disable-user-list=true") > gui_conf
cp gui_conf /etc/gdm3/greeter.dconf-defaults
rm gui_conf

dpkg-reconfigure gdm3

awk '!/Enable=true/' /etc/gdm3/custom.conf > gui_conf
cp gui_conf /etc/gdm3/custom.conf
rm gui_conf

# Removes the message of the day to avoid displaying sensitive information
rm /etc/motd

# Configures remote desktop warning banner to avoid displaying sensitive information
echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue.net

sed -e 's:\m:|\r|\s\|\v:)::g' /etc/issue.net
cp gui_conf /etc/issue.net
rm gui_conf

# Configures warning banner to avoid displaying sensitive information
echo "Authorized uses only. All activity may be monitored and reported." > /etc/issue

sed -e 's:\m:|\r|\s\|\v:)::g' /etc/issue
cp gui_conf /etc/issue
rm gui_conf
}

rm_service() {
lsof -i -P -n | grep -v "(ESTABLISHED)"
echo "Do you wish to remove any of these services? y/n"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
  do
    echo "What service would you like to remove?"
    read -r service
    systemctl --now mask "$service"
    apt purge "$service" -y
    apt remove "$service" -y
    
    echo "Would you like to remove any other services? y/n"
    read -r yn
  done
fi
}

log_sus_packets() {
(cat /etc/sysctl.conf ; echo "net.ipv4.conf.all.log_martians = 1") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

(cat /etc/sysctl.conf ; echo "net.ipv4.conf.default.log_martians = 1") > sysctl_conf
cp sysctl_conf /etc/sysctl.conf

rm sysctl_conf

sysctl -w net.ipv4.conf.all.log_martians=1 
sysctl -w net.ipv4.conf.default.log_martians=1 
sysctl -w net.ipv4.route.flush=1 
}

clamav() {
echo "Run clamav in a different window by running: cypat-clamav"
echo "Infected files will be moved to the directory Infected_Files"
proceed
}

rkhunter() {
echo "Searching for rootkits..."
bash ./Cyber-patriots/ubuntu/main/support/rkhunter.sh
proceed
}

chkrootkit() {
echo "Searching for rootkits again..."
bash ./Cyber-patriots/ubuntu/main/support/chkrootkit.sh
proceed
}

antivirus() {
apt install clamav rkhunter chkrootkit -y
apt update -y
clamav
rkhunter
chkrootkit
}

updates() {
apt update -y
apt upgrade -y
apt dist-upgrade -y
}

netstat() {
echo "Would you like to use netstat tools?"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
 echo "Installing Netstat..."
 apt-get update -y
 apt install net-tools -y
 bash ./support/netstat.sh
 proceed
fi
}

firefox() {
echo "Is firefox installed? Y/N"
echo ""
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
 apt install firefox -y
 echo "Should Firefox installed as snap? "
 read -r yn
 if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
 then
  echo "Updating Firefox"
  apt-get update -y
  apt-get install firefox -y
  location="/snap/firefox/1635/usr/lib/firefox/"
 elif [[ "$yn" = "n" ]] || [[ "$yn" = "N" ]]
 then
  snap remove firefox
  add-apt-repository ppa:mozillateam/ppa -y
  echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
  echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
  apt install firefox -y
  location="/usr/lib/firefox/"
 fi
 
 cd ~
 echo "Setting Firefox preferences..."
 ./Cyber-patriots/ubuntu/main/firefox/main.sh "$location"
 echo "Firefox preferences set for all profiles"
fi
}

rm_mal_programs() {
while IFS= read -r line
do
 echo "Remove $line if exists? "
 read -r yn
 if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
 then
  apt-get --purge remove "$line" -y
  touch del_package_tmp.txt
  dpkg -L "$line" | grep "$line" >> del_package_tmp.txt
  while IFS= read -r items
  do
   rm -r -f "$items"
  done < ./Cyber-patriots/ubuntu/main/del_package_tmp.txt
  rm del_package_tmp.txt
 fi
done < ./Cyber-patriots/ubuntu/main/support/programs.txt
}

##############################################

# Code

echo "$banner"

echo "Programs running..."

add-apt-repository main -y
add-apt-repository universal -y
add-apt-repository restricted -y
add-apt-repository multiverse -y

# Remove Postfix Mail Service as it kills the script.
apt remove postfix -y
apt purge postfix -y

# Installs tools
apt install nano -y
apt install tree -y
apt install python3 -y
apt install synaptic ranger -y
apt-get install systemd -y
apt-get install members -y

netstat

# Moves Scripts to home directory if not already there
user="${SUDO_USER:-$USER}"
home_dir="/home/$user/"

file_path="$(realpath "$0")"
name="${file_path%'Cyber-patriots'*}"

mv "$name/Cyber-patriots/" "$home_dir"

rm -r -f "/home/$user/Cyber-patriots/windows/"

# Run Setup Script
bash ./support/setup.sh

# Runs all Functions
updates
enable_ufw
#enable_audit
fail2ban
secure_pass
crontab_conf
daily_updates
secure_sysctl
disable_mounting
sticky_bit
aide
boot
aslr
core_dump
app_armour
gui
rsyslog
permissions
antivirus
rm_mal_programs

# Firefox
firefox

# Removes unwanted programs and files
rm /etc/motd
apt purge prelink -y
apt remove prelink -y
rm_services

echo "Done"

# Add Users
cut -d: -f1 /etc/passwd
echo "Do you want to add any users? Y/N"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
  do
    echo "What user would you like to add?"
    read -r add
    useradd "$add" && echo "User Added"
    echo "Do you want to add another user?"
    read -r yn
  done
fi

# Remove Users
cut -d: -f1 /etc/passwd
echo "Do you want to delete any users? Y/N"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
  do
    echo "What user would you like to delete?"
    read -r delete
    userdel "$delete" && echo "User Deleted"
    echo "Do you want to delete another user?"
    read -r yn
  done
fi

# Change Passwords
cut -d: -f1 /etc/passwd
echo "Do you want to change any users passwords? Y/N"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
  do
    echo "Who’s password would you like to change?"
    read -r change
    echo -e "q^yRpNgbes2wM*xR\nq^yRpNgbes2wM*xR" | passwd "$change" && echo "Password Changed"
    echo "Do you want to change another password?"
    read -r yn
  done
fi

# Secure FTP Server
echo "Are you using a FTP Server? Y/N"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
  apt update vsftpd -y
  apt upgrade vsftpd -y
  ufw allow ftp

else
  apt purge vsftpd -y
  ufw deny ftp
fi

# Removes CUPS
echo "Are you using any print services? Y/N"
read -r yn
if [[ "$yn" = "n" ]] || [[ "$yn" = "N" ]]
then
  apt purge cups -y
fi

# Removes Samba
echo "Are you using Samba (A system to share files with windows)? Y/N"
read -r yn
if [[ "$yn" = "n" ]] || [[ "$yn" = "N" ]]
then
  apt purge samba -y
  apt remove samba-common samba-common-bin && sudo apt purge samba samba-common samba-common-bin
  rm -r /var/lib/samba/printers/W32X86
  rm -r /var/lib/samba/printers/x64
fi

# Removes Telnet
echo "Are you using Telnet? Y/N"
read -r yn
if [[ "$yn" = "n" ]] || [[ "$yn" = "N" ]]
then
  apt purge telnet -y
fi

# Removes Netcat
echo "Are you using Netcat? Y/N"
read -r yn
if [[ "$yn" = "n" ]] || [[ "$yn" = "N" ]]
then
  apt purge netcat -y
fi

# Remove other services
lsof -i -P -n | grep -v "(ESTABLISHED)"
echo "Do you want to remove any other services? Y/N"
read -r yn
if [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
then
 while [[ "$yn" = "y" ]] || [[ "$yn" = "Y" ]]
 do
    rm_service
 done
fi

# Secure SSH Server
secure_ssh

# Edit Groups
change_groups

# Secures Kernel
apt-get linux-image-generic -y

sysctl -p

apt upgrade -y
apt update -y
apt autoremove -y
apt-get autoclean -y

echo "This device needs to reboot to save changes"
echo "Rebooting..."

proceed

reboot
