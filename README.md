
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
    - [ ] Configure Firefox
        - [x] Write the code
        - [ ] Test If Code Is Scored
    - [ ] Enforce Password and Audit rules
        - [x] Write Code
        - [ ] Confirm that code is successfull
        - [ ] Check if config files are the same between versions.
            - [ ] If so, rewrite code to use preset config files
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
- [ ] Fix UI for Y/N response, especially with group management
- [ ] URGENT: Find the reason for passworf lockout after use of script
### Issue List:
- [ ] Issue 1: Awk issue at or near =. Location, after firewall.
- [ ] Issue 2: Module not loaded. In between Sysclt configured and Mounting Disabled.
- [ ] Issue 3: Command grub_cfg not found. On line 743
- [ ] Issue 4: Grep invalid range end. After line 743 and before kernal randomized
- [ ] Issue 5: Deprecated service tally being used in function pass_lockout, switch to cracklib.
- [ ] Issue 6: Remove Email Configuration from AuditD
