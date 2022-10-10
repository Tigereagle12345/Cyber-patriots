import os

# Tigereagle12345's Cyber Patriot Script -Windows 10-
#
# IMPORTANT
#
# FOR USE OF TEAM 14-4347 ONLY!!!
#
# Note
#
# This script was designed to be run as an administrator on Windows 10 and may not work if not run this way

def firefox():
  print("Setting Firefox preferences...")
  os.system("start %~dp0windowsfirefoxmain.py")
  print("Done")
  
def banner():
  banner = "###################################################################################################"
  print(banner)

banner()
firefox()
