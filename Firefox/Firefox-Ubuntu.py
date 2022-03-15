#!/usr/bin/env python3

import selenium
from selenium import webdriver
from webdriver_manager.firefox import GeckoDriverManager

driver = webdriver.Firefox(executable_path=GeckoDriverManager().install())

# Different types of forms

#---------------------------------------------

# Checkboxes

def checkbox(name, onoff):
  check = driver.find_element_by_id(name).is_selected()
  if check == True:
    if onoff == "off"
      driver.find_element_by_id(name).click()
  elif check == False:
    if onoff == "on"
      driver.find_element_by_id(name).click()
  else:
    print("Error, checkbox selection is type " + str(check))

#---------------------------------------------

# Radio Buttons

def radiobutton(name):
  driver.find_element_by_id(name).click()

#---------------------------------------------

# Dropdowns

def dropdown(name, select):
  drop = Select(driver.find_element_by_id(name))
  drop.select_by_value(select)

#---------------------------------------------

# Buttons

def button(name):
  driver.find_element_by_id(name).click()

#---------------------------------------------

# Settings

settings = {

"general": {
            "updates": {"name": "autoDesktop", "type": "radio"} 
            "downloads": {"name": "alwaysAsk", "type": "radio"}
            "language": {"name": "defaultBrowserLanguage", "type": "drop", "select": "en-US"}
           }
"security": {
            "trackblock": {"name": "strictRadio", "type": "radio"}
            "delcookies": {"name": "deleteOnClose", "type": "check", "onoff": "on"}
            "savepass": {"name": "savePasswords", "type": "check", "onoff": "off"}
            "autopass": {"name": "passwordAutofillCheckbox", "type": "check", "onoff": "off"}
            "genpass": {"name": "generatePasswords", "type": "check", "onoff": "on"}
            "showalert": {"name": "breachAlerts", "type": "check", "onoff": "on"}
            "blockpopup": {"name": "popupPolicy", "type": "check", "onoff": "on"}
            "noaddon": {"name": "warnAddonInstall", "type": "check", "onoff": "on"}
            "dangercont": {"name": "enableSafeBrowsing", "type": "check", "onoff": "on"}
            "blockdownload": {"name": "blockDownloads", "type": "check", "onoff": "on"}
            "uncomsoft": {"name": "blockUncommonUnwanted", "type": "check", "onoff": "on"}
            "certificate": {"name": "enableOCSP", "type": "check", "onoff": "on"}
            "httpsonly": {"name": "httpsOnlyRadioEnabled", "type": "radio"}
            "showalert": {"name": "historyMode", "type": "drop", "select": "dontremeber"}
           }
}

#---------------------------------------------

# Code

browser.get("about:preferences#general")
