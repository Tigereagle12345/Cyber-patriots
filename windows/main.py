import os

def firefox():
  print("Setting Firefox preferences...")
  os.system("start %~dp0/windows/firefox/main.py/")
  print("Done")
  
def banner():
  print()
  banner = "###################################################################################################\n\n _____\n____    __    __    ______      _______     ______                  \n|    _____|   \ \  / /   |      |    |   ____|   |      |         \n|   |          \ \/ /    |  []   |   |  |___     |  []  |         \n|   |           |  |     |      |    |   ___|    |      |         \n|   |_____      |  |     |  []   |   |  |____    |  |\  \         \n|_________|     |__|     |______|    |_______|   |__| \__\        \n\n ______        ____         __________     ______       __      ______      __________\n|      |      /    \       |___    ___|   |      |     |  |    /  __  \    |___    ___|\n|  []  |     /  []  \          |  |       |  []  |     |  |   |  |  |  |       |  |\n|   ___|    /   __   \         |  |       |      |     |  |   |  |  |  |       |  |\n|  |       /   /  \   \        |  |       |  |\  \     |  |   |  |__|  |       |  |\n|__|      /___/    \___\       |__|       |__| \__\    |__|    \______/        |__|\n\n __________     _______         ____         __          __\n|___    ___|   |   ____|       /    \       |  \        /  |\n    |  |       |  |___        /  []  \      | | \      / | |\n    |  |       |   ___|      /   __   \     | |\ \    / /| |\n    |  |       |  |____     /   /  \   \    | | \ \__/ / | |\n    |__|       |_______|   /___/    \___\   |_|  \____/  |_|\n\n ___     ___     _______     ___     ___      _________\n|   |   |   |   |____   |   |   |   |   |    |_____    /\n|   |___|   |    ____|  |   |   |___|   |         /   /\n|_______    |   |____   |   |_______    |        /   /\n        |   |    ____|  |           |   |       /   /\n        |___|   |_______|           |___|      /___/\n\n###################################################################################################
  print(banner)

firefox()
