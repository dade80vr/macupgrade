#!/bin/bash
# macupgrade (https://github.com/dade80vr/macupgrade) - version 3.0
#
# Upgrade HomeBrews, Mac OS and other stuff in one time!
# Created by Davide Permunian (https://github.com/dade80vr)
# See requirements in README.md
#
# Last update in September, 2017

#sourcing bash colours
source bash-colours.sh

#banner
echo -e "${IBlue}"
echo -e "********************************************************"
echo -e "                   macupgrade v3.0"
echo -e " Upgrade HomeBrews, Mac OS and other stuff in one time!"
echo -e "      https://github.com/dade80vr/macupgrade"
echo -e "                  --help for manual"
echo -e "********************************************************"
echo -e "${Color_Off}"


case $1 in
	"")
		runmode="/dev/null"
		echo -e "- Running in quite mode (default) -"
		echo -e ""
		;;
	-v)
		runmode="/dev/tty"
		echo -e "- Running in verbose mode (-v) -"
		echo -e ""
		;;
	-m)
		echo -e "monochrome mode, still working, please wait"
		echo -e ""
		exit 1
		;;
	--help)
		echo -e "Showing help"
		echo -e ""
		echo -e "-v : verbose mode, show output from any script (default hide)"
		echo -e "-m : monochrome mode, still working, please wait"
		echo -e ""
		echo -e "--help : show this help"
		echo -e ""
		exit 1
		;;
	*)
		echo -e "This action does not exist! Use ./macupgrade.sh --help to show help."
		echo ""
		exit 1
		;;
esac

#modify owner of /usr/local ***** could there be a better solution? *****
own_usr=$(stat "/usr/local" | awk '{print $5}')
#if different, set new owner
if [ "$own_usr" != "$(whoami)" ]; then
	echo -e "${IRed}*** Step 0/7 *** Set $(whoami) as new owner of /usr/local folder (was $own_usr): ${IPurple}insert your super-user pass if required.. ${Color_Off}"
	sudo chown -R $(whoami) /usr/local > $runmode
	if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
fi

#upgrading HomeBrew and Cask
echo -en "${IYellow}*** Step 1/7 *** Run HomeBrew update.. ${Color_Off}"
brew update > $runmode
if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
echo -en "${IYellow}*** Step 2/7 *** Run HomeBrew upgrade.. ${Color_Off}"
brew upgrade > $runmode
if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi

#homeBrew + Cask cache cleaning
echo -en "${IYellow}*** Step 3/7 *** Clear HomeBrew cache.. ${Color_Off}"
brew cleanup --force > $runmode
brew cask cleanup > $runmode
rm -f -r /Library/Caches/Homebrew/* > $runmode
if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi

#Atom upgrade without confirm
echo -en "${IYellow}*** Step 4/7 *** Run Atom upgrade.. ${Color_Off}"
apm upgrade -c false > $runmode
if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi

#NPM upgrade
echo -en "${IYellow}*** Step 5/7 *** Run NPM update.. ${Color_Off}"
npm update -g > $runmode
if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi

#upgrading MAS
echo -en "${IYellow}*** Step 6/7 *** Check Mac App Store upgrades: ${IPurple}insert your Apple ID pass if required.. ${Color_Off}"
mas upgrade > $runmode
if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi

#system updates
echo -e "${IYellow}*** Step 7/7 *** Check Mac OS upgrades: ${IPurple}insert your super-user pass if required.. ${Color_Off}"
sudo softwareupdate -iva > $runmode

#finish!
echo -e "${IGreen}***** End! *****${Color_Off}"
