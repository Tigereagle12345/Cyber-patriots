
# Cyber-patriots

## Warning:

For use of my Cyber Patriot team only and/or with my explicit permission! In the event that another Cyber Patriot team uses this script, they will be in violation of Cyber Patriot rules and may be eliminated from the competition.


## Overview:

This program contains some scripts to be used in Cyber Patriot competitions or for Cyber Securtity in general. Currently, there are small scripts built for Windows and Linux, broadly.


## Supported OS':

* Windows
    * Windows 10 Enteprise
    * Windows Server
        * Windows Server 2016
        * (Coming Soon!) Windows Server 2019
* Linux
    * Ubuntu
        * Ubuntu 20.04
        * Ubuntu 22.04
    * (Coming Soom!) Fedora


## TODO:
* Ubuntu
    - [x] Add/Delete Users
    - [x] Manage Groups
    - [x] Remove known malicious programs
    - [x] Configure Firefox
        - [x] Write the code
        - [x] Test If Code Is Scored
    - [ ] Enforce Password and Audit rules
        - [x] Write Code
        - [x] Confirm that code is successfull
        - [x] Check if config files are the same between versions.
            - [x] If so, rewrite code to use preset config files
        - [ ] Rewrite the password lockout using the failock module for PAM
     - [ ] Check for Issues
         - [ ] Unable to handle repository shortcut 'univeral'.
         - [ ] XServer unintentionally being installed. Unknown if this will cause issues.
     - [ ] UI Issues
         - [ ] Route Apt Output to /dev/null or equivalent.
     
    - [x] Configure Firewall
    - [ ] Find, list and fix errors in the script.
         - [x] Find Errors
         - [x] List Errors
         - [ ] Fix Errors
    - [ ] Fix `cypat-man` and other commands
* Windows
    - Basically Everything
        - [ ] Find a good Python compiler
        - [ ] Learn Powershell
        - [ ] Learn Batch


## Issues:
- [x] Fix UI for Y/N response, especially with group management
- [x] URGENT: Find the reason for password lockout after use of script
### Issue List:
- [ ] Issue 1: Awk issue at or near =. Location, after firewall.
- [ ] Issue 2: Module not loaded. In between Sysctl configured and Mounting Disabled.
- [x] Issue 3: Command grub_cfg not found. On line 743.
- [ ] Issue 4: Grep invalid range end. After line 743 and before kernal randomized.
- [ ] Issue 5: Deprecated service tally being used in function pass_lockout, switch to cracklib.
- [x] Issue 6: Remove Email Configuration from AuditD.
- [x] Issue 7: Netstat Tools using incorrect method of finding files.
- [x] Issue 8: Missing operand for 'dirname'. Location, in Netstat Tools.
- [x] Issue 9: Command 'realpath' being given incorrect path.
- [x] Issue 10: Incorrect location for /support/setup.sh.
- [ ] Issue 11: Line 499: chkconfig: command not found.
- [ ] Issue 12: Runaway string constant "#net.ipv4. Awk near 'Bad Error Message Protection Enabled'.
- [ ] Issue 13: Runaway string constant "net.ipv4.c Awk near 'Bad Error Message Protection Enabled' and 'SYN cookies to ensure a server avoids dropping connections when the SYN queue fills up Enabled'.
- [ ] Issue 14: Runaway string constant "#net.ipv4. Awk near 'SYS backlog queue size increased to 2048'.
- [ ] Issue 15: Sysctl: cannot stat /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_syn_recv: No such file or directory.
- [ ] Issue 16: Awk: 1: unexpected character '.'. After IP Forwarding Disabled.
- [ ] Issue 17: Line 679: install freevxfs /bin/true: No such file or directory.
- [ ] Issue 18: Line 680: install jffs2 /bin/true: No such file or directory.
- [ ] Issue 19: Line 681: install hfs /bin/true: No such file or directory.
- [ ] Issue 20: Line 682: install hfsplus /bin/true: No such file or directory.
- [ ] Issue 21: Line 683: install squashfs /bin/true: No such file or directory.
- [ ] Issue 22: Line 684: install udf /bin/true: No such file or directory.
- [ ] Issue 23: Line 685: install vfat /bin/true: No such file or directory.
- [ ] Issue 24: Rmmod: ERROR: Module cramfs is not currently loaded.
- [ ] Issue 25: Rmmod: ERROR: Module freevxfs is not currently loaded.
- [ ] Issue 26: Rmmod: ERROR: Module jffs2 is not currently loaded.
- [ ] Issue 27: Rmmod: ERROR: Module hfs is not currently loaded.
- [ ] Issue 28: Rmmod: ERROR: Module hfsplus is not currently loaded.
- [ ] Issue 29: Rmmod: ERROR: Module udf is not currently loaded.
- [ ] Issue 30: Sed: -e expression #1, char 17: unknown option to 's'. Above Rsyslog installation.
- [x] Issue 31: Realpath: “./Cyber-patriots/ubuntu/main/ubuntu.sh”: No such file or directory, and dirname: missing operand in RkHunter function.
- [x] Issue 32: Realpath: “./Cyber-patriots/ubuntu/main/ubuntu.sh”: No such file or directory, and dirname: missing operand in ChkRootkit function.
- [ ] Issue 33: Line 1062: rm_services: command not found.
- [ ] Issue 34: Line 559: /etc/init.d/ssh: No such file or directory. In SSH Function.
- [ ] Issue 35: E: Invalid operation linux-image-generic. After Group Editing.
