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

#Define Global Variables

yn_list = {
"y":["Y", "y", "Yes", "YES", "yes"],
"n":["N", "n", "No", "NO", "no"]
}

def firefox():
  print("Setting Firefox preferences...")
  os.system("start %~dp0/windows10/main/firefox/main.py")
  print("Done")
  
def banner():
  banner = "###################################################################################################"
  print(banner)
  
def firewall():
  os.system("netsh advfirewall set allprofiles state on")
  firewall_port("off", 21)
  firewall_port("off", 23)
  firewall_port("off", 139)
  firewall_port("off", 445)
  firewall_port("off", 1433)
  firewall_port("off", 1434)
  firewall_port("off", 3306)
  firewall_port("on", 22)
  
def firewall_port(off_on, port):
  if off_on == "on":
    os.system(f'netsh advfirewall firewall add rule name="Allow Port {str(port)}" dir=in action=allow protocol=TCP remoteport={str(port)}')
  elif off_on == "off":
    os.system(f'netsh advfirewall firewall add rule name="Allow Port {str(port)}" dir=in action=block protocol=TCP remoteport={str(port)}')
  else:
    print("Error: Incorrect port rule!")

def user_management(yn_list):
  os.system("net user")
  yn = str(input("Do you want to add any users? Y/N "))
  t = True
  if yn in yn_list["y"]:
    while t == True:
      username = str(input("Username to add: "))
      password = str(input("Password to add: "))
   elif yn in yn_list["n"]
    
banner()
firefox()
