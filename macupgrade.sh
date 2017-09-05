#!/bin/bash
# Auto Mac & HomeBrew upgrade script by Davide Permunian (https://github.com/dade80vr)
# Require MAS https://github.com/mas-cli/mas

#sourcing bash colours
source bash-colours.sh

#banner
echo -e "${IBlue}"
echo -e "******************************************"
echo -e "******** MacUpgrade  by dade80vr *********"
echo -e "**** HomeBrew e Mac OS upgrade script ****"
echo -e "*************** version  3 ***************"
echo -e "******************************************"
echo -e "${Color_Off}"

#check owner of /usr/local
own_usr=$(stat "/usr/local" | awk '{print $5}')
#if different, set new owner
if [ "$own_usr" != "$(whoami)" ]; then
	echo -e "${IRed}********* Set $(whoami) as new owner of /usr/local folder ${IPurple}(insert your super-user pass if required)${Color_Off}"
	sudo chown -R $(whoami) /usr/local > /dev/null
fi

#upgrading HomeBrew and Cask
echo -en "${IYellow}********* Run HomeBrew update.. ${Color_Off}"
brew update > /dev/null
echo -e "${IGreen}done!${Color_Off}"
echo -en "${IYellow}********* Run HomeBrew upgrade.. ${Color_Off}"
brew upgrade > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#homeBrew cache cleaning
echo -en "${IYellow}********* Clear HomeBrew cache.. ${Color_Off}"
brew cleanup --force > /dev/null
rm -f -r /Library/Caches/Homebrew/* > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#upgrading MAS
echo -en "${IYellow}********* Check Mac App Store upgrades: ${IPurple}insert your Apple ID pass if required.. ${Color_Off}"
mas upgrade > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#system updates
echo -en "${IYellow}********* Check Mac OS upgrades: ${IPurple}insert your super-user pass if required.. ${Color_Off}"
sudo softwareupdate -iva > /dev/null
echo -e "${IGreen}done!${Color_Off}"

#finish!
echo -e "${IGreen}********* End!${Color_Off}"
