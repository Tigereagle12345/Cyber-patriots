import os

profiles = []

appdata = os.getenv("appdata")
print(appdata)

file = open(f"{appdata}\Mozilla\Firefox\profiles.ini", "r")
for line in file:
	if "Path=" in line:
		profile_path = line.replace("Path=", "")
		profile_path = profile_path.replace("\n", "")
		profiles.append(profile_path)
        
file.close

for item in profiles:
	os.system("cd ~")
	os.system("cd Cyber-patriot/windows10/main/firefox/")
	prefs = open("user.js", "r")
	users = open(f"{appdata}\Mozilla\Firefox\user.js", "a")
	for line in prefs:
		users.write(line)
        
	prefs.close
	users.close
