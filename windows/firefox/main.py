import os

profiles = []

os.system("cd ~")
os.system("cd %AppData%/Mozilla/Firefox/")
file = open("profiles.ini", "r")
for line in file:
    if "Path=" in line:
        profile_path = line.replace("Path=", "")
        profile_path = profile_path.replace("\n", "")
        profiles.append(profile_path)
file.close
        
for item in profiles:
    os.system("cd ~")
    os.system("cd Cyber-patriot/windows/firefox/")
    prefs = open("user.js", "r")
    os.system("cd ~")
    os.system("cd %AppData%/Mozilla/Firefox/")
    users = open("user.js", "a")
    for line in prefs:
        users.write(line)
    prefs.close
    users.close
