import os

# Tigereagle12345's Cyber Patriot Script -Windows 10-
#
# IMPORTANT
#
# FOR USE OF TEAM 14-4347 ONLY!!!
#
# Note
#
# This script was designed to be run as an administrator on Windows 10 and may not work if not run this way.
# The default password for the script (The one it sets passwords as) is q^yRpNgbes2wM*xR

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
  banner = """
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
  """
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

def user_management_add(yn_list):
  os.system("net user")
  yn = str(input("Do you want to add any users? Y/N "))
  if yn in yn_list["y"]:
    username = str(input("Username to add: "))
    os.system(f"net user {username} q^yRpNgbes2wM*xR /add")
    user_management_add(yn_list)
      
  elif yn in yn_list["n"]:
    print("Ok, Moving on...")
  
  else:
    print("Error: Non-Standard Input")

def user_management_delete(yn_list):
  os.system("net user")
  yn = str(input("Do you want to remove any users? Y/N "))
  if yn in yn_list["y"]:
    username = str(input("User to remove: "))
    os.system(f"net user {username} /delete")
    user_management_delete(yn_list)
      
  elif yn in yn_list["n"]:
    print("Ok, Moving on...")

  else:
    print("Error: Non-Standard Input")

def user_management_change(yn_list):
  os.system("net user")
  yn = str(input("Do you want to change any user passwords? Y/N "))
  if yn in yn_list["y"]:
    username = str(input("User to change password: "))
    os.system(f"net user {username} {password}")
    user_management_change(yn_list)
      
  elif yn in yn_list["n"]:
    print("Ok, Moving on...")

  else:
    print("Error: Non-Standard Input")

def user_management(yn_list):
  user_management_add(yn_list)
  user_management_delete(yn_list)
  user_management_change(yn_list)

def group_management_add(yn_list, group):
  os.system(f"net user && net localgroup {group}")
  yn = str(input(f"Do you want to add any users to the {group} group? Y/N "))
  if yn in yn_list["y"]:
    username = str(input("Username to add: "))
    os.system(f"net localgroup {group} {username} /add")
    group_management_add(yn_list, group)
      
  elif yn in yn_list["n"]:
    print("Ok, Moving on...")
  
  else:
    print("Error: Non-Standard Input")

def group_management_delete(yn_list, group):
  os.system(f"net localgroup {group}")
  yn = str(input(f"Do you want to remove any users from the {group} group? Y/N "))
  if yn in yn_list["y"]:
    username = str(input("User to remove: "))
    os.system(f"net localgroup {group} {username} /delete")
    group_management_delete(yn_list, group)
      
  elif yn in yn_list["n"]:
    print("Ok, Moving on...")

  else:
    print("Error: Non-Standard Input")

def group_management(yn_list):
  group_management_add(yn_list, "Administrators")
  group_management_delete(yn_list, "Administrators")

banner()
group_management(yn_list)
firewall()
firefox()
