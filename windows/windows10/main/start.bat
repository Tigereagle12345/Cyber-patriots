@echo off
if %errorlevel%==0 (
	echo Admin rights granted!
  start main.py
) else (
    echo Failure, no rights
	pause
    exit
)
