@echo off
REM Config ls
doskey ls=dir /B
REM Config nano
doskey nano=notepad.exe $*
REM Config vi
doskey vi=notepad.exe $*
REM Config vim
doskey vim=notepad.exe $*
REM Config cat
doskey cat=type $*
REM Config rm
doskey rm=del $* && Command Completed Sucessfully!
reg add "HKCU\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d C:\Users\eamon\Documents\CyPat-Win10\test.bat /f
cls
echo Microsoft Windows [Version 10.0.19043.2006]
echo (c) Microsoft Corporation. All rights reserved.
