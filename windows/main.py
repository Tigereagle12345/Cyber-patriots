import os

def firefox():
  print("Setting Firefox preferences...")
  os.system("start %~dp0/windows/firefox/main.py/")
  print("Done")
  
firefox()
