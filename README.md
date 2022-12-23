
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
    - [ ] Fix `cypat-man` and other commands
* Windows
    - Basically Everything
        - [ ] Find a good Python compiler
        - [ ] Learn Powershell
        - [ ] Learn Batch


## Issues:
- [ ] TODO: Find all errors
- [x] Fix UI for Y/N response, especially with group management
- [x] URGENT: Find the reason for password lockout after use of script
### Issue List:
- [ ] Issue 1: Awk issue at or near =. Location, after firewall.
- [ ] Issue 2: Module not loaded. In between Sysclt configured and Mounting Disabled.
- [ ] Issue 3: Command grub_cfg not found. On line 743.
- [ ] Issue 4: Grep invalid range end. After line 743 and before kernal randomized.
- [ ] Issue 5: Deprecated service tally being used in function pass_lockout, switch to cracklib.
- [x] Issue 6: Remove Email Configuration from AuditD.
- [ ] Issue 7: Netstat Tools using incorrect method of finding files.
- [ ] Issue 8: Missing operand for 'dirname'. Location, in Netstat Tools.
- [ ] Issue 9: Command 'realpath' being given incorrect path.
- [ ] Issue 10: Incorrect location for /support/setup.sh.
- [ ] 
