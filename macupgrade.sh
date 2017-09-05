#!/bin/bash
# Auto Mac & HomeBrew upgrade script by Davide Permunian (@dade80vr)
# Require MAS @ https://github.com/mas-cli/mas

#sourcing bash colours
source bash-colours.sh

#banner
echo -e "${IBlue}"
echo -e "*******************************************"
echo -e "********* Auto Mac Upgrade Script *********"
echo -e "*********       by dade80vr       *********"
echo -e "*********        version 3        *********"
echo -e "*******************************************"
echo -e "${Color_Off}"

#check owner of /usr/local
own_usr=$(stat "/usr/local" | awk '{print $5}')
#if different, set new owner
if [ "$own_usr" != "$(whoami)" ]; then
	echo -e "${IRed}********* Set $(whoami) as new owner of /usr/local folder${IPurple}(insert your super-user pass if required)${Color_Off}"
	sudo chown -R $(whoami) /usr/local
fi

#upgrading HomeBrew and Cask
echo -e "${IYellow}********* Run HomeBrew update${Color_Off}"
brew update
echo -e "${IYellow}********* Run HomeBrew upgrade${Color_Off}"
brew upgrade

#homeBrew cache cleaning
echo -e "${IYellow}********* Clear HomeBrew cache${Color_Off}"
brew cleanup --force
rm -f -r /Library/Caches/Homebrew/*

#upgrading MAS
echo -e "${IYellow}********* Check Mac App Store upgrades ${IPurple}(insert your Apple ID pass if required)${Color_Off}"
mas upgrade

#system updates
echo -e "${IYellow}********* Check Mac OS upgrades${IPurple}(insert your super-user pass if required)${Color_Off}"
sudo softwareupdate -iva

#finish!
echo -e "${IGreen}********* End!${Color_Off}"
