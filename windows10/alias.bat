@echo off
REM Config ls
DOSKEY ls=dir /B
REM Config nano
DOSKEY nano=notepad.exe $*
REM Config vi
DOSKEY vi=notepad.exe $*
REM Config vim
DOSKEY vim=notepad.exe $*
REM Config cat
DOSKEY cat=type $*

cls
