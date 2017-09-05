#!/bin/bash
# macupgrade (https://github.com/dade80vr/macupgrade) - version 3.0
#
# Upgrade HomeBrews, Mac OS and other stuff in one time!
# Created by Davide Permunian (https://github.com/dade80vr)
# See requirements in README.md
#
# Last update: September 5, 2017

#sourcing bash colours
source bash-colours.sh

#banner
echo -e "${IBlue}"
echo -e "******************************************"
echo -e "          macupgrade by dade80vr"
echo -e "  https://github.com/dade80vr/macupgrade"
echo -e "                version 3"
echo -e "******************************************"
echo -e "${Color_Off}"

#check owner of /usr/local
own_usr=$(stat "/usr/local" | awk '{print $5}')
#if different, set new owner
if [ "$own_usr" != "$(whoami)" ]; then
	echo -e "${IRed}*** Step 0/7 *** Set $(whoami) as new owner of /usr/local folder: ${IPurple}insert your super-user pass if required.. ${Color_Off}"
	sudo chown -R $(whoami) /usr/local > /dev/null
	echo -e "${IGreen}done!${Color_Off}"
fi

#upgrading HomeBrew and Cask
echo -en "${IYellow}*** Step 1/7 *** Run HomeBrew update.. ${Color_Off}"
brew update > /dev/null
echo -e "${IGreen}done!${Color_Off}"
echo -en "${IYellow}*** Step 2/7 *** Run HomeBrew upgrade.. ${Color_Off}"
brew upgrade > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#homeBrew + Cask cache cleaning
echo -en "${IYellow}*** Step 3/7 *** Clear HomeBrew cache.. ${Color_Off}"
brew cleanup --force > /dev/null
brew cask cleanup > /dev/null
rm -f -r /Library/Caches/Homebrew/* > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#Atom upgrade without confirm
echo -en "${IYellow}*** Step 4/7 *** Run Atom upgrade.. ${Color_Off}"
apm upgrade -c false > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#NPM upgrade
echo -en "${IYellow}*** Step 5/7 *** Run NPM update.. ${Color_Off}"
npm update -g > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#upgrading MAS
echo -en "${IYellow}*** Step 6/7 *** Check Mac App Store upgrades: ${IPurple}insert your Apple ID pass if required.. ${Color_Off}"
mas upgrade > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#system updates
echo -e "${IYellow}*** Step 7/7 *** Check Mac OS upgrades: ${IPurple}insert your super-user pass if required.. ${Color_Off}"
sudo softwareupdate -iva > /dev/null

#finish!
echo -e "${IGreen}***** End! *****${Color_Off}"
