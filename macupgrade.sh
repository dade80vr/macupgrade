#!/bin/bash
# macupgrade (https://github.com/dade80vr/macupgrade) - v3.4.1-temp
#
# Upgrade HomeBrews, Mac OS and other stuff in one time!
# Created by Davide Permunian (https://github.com/dade80vr)
# See requirements in README.md
#
# Last update in January, 2020

# High Intensity colours
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
# Reset
Color_Off='\033[0m'       # Text Reset

#start banner
echo -e "$IBlue"
echo -e "********************************************************"
echo -e "                   macupgrade v3.4.1-temp"
echo -e " Upgrade HomeBrews, Mac OS and other stuff in one time!"
echo -e "      https://github.com/dade80vr/macupgrade"
echo -e "                  --help for manual"
echo -e "********************************************************"
echo -e "$Color_Off"

#arguments check
case $1 in
	"")
		runmode="/dev/null"
		echo -e "- Running in quiet mode (default) -"
		echo -e ""
		;;
	-v)
		runmode="/dev/tty"
		echo -e "- Running in verbose mode (-v) -"
		echo -e ""
		;;
	-m)
		runmode="/dev/null"
		IRed=$Color_Off
		IGreen=$Color_Off
		IYellow=$Color_Off
		IBlue=$Color_Off
		IPurple=$Color_Off
		echo -e "- Running in monochrome & quiet mode -"
		echo -e ""
		;;
	--help)
		echo -e "Showing help"
		echo -e ""
		echo -e "-v : verbose mode, show output from any script (default hide)"
		echo -e "-m : monochrome mode"
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

#check if AWK exist
if ! [ -x "$(command -v awk)" ]
then
	echo -e "${IRed}**** ERROR **** AWK not installed! Please install it ( http://brewformulas.org/Awk )${Color_Off}"
  exit 1
fi

# modify owner of /usr/local ****** could there be a better solution? *****
#
# removed temporeary, not needed if owner is root and user is only one
#
#	own_usr=$(stat "/usr/local" | awk '{print $5}')
#	#if different, set new owner
#	if [ "$own_usr" != "$(whoami)" ]; then
#		echo -e "${IRed}**** Step 0/7 **** Set $(whoami) as new owner of /usr/local folder (was $own_usr): ${IPurple}insert your super-user pass if required.. ${Color_Off}"
#		sudo chown -R $(whoami) /usr/local > $runmode
#		if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
#	fi
#

#upgrading HomeBrew and Cask
if ! [ -x "$(command -v brew)" ]
then
  echo -e "${IRed}SKIP Step 1/7 **** BREW not installed ( https://brew.sh/index_it.html )${Color_Off}"
	echo -e "${IRed}SKIP Step 2/7 **** BREW not installed ( https://brew.sh/index_it.html )${Color_Off}"
	echo -e "${IRed}SKIP Step 3/7 **** BREW not installed ( https://brew.sh/index_it.html )${Color_Off}"
else
	echo -en "${IYellow}**** Step 1/7 **** Run HomeBrew update.. ${Color_Off}"
	brew update > $runmode
	if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
	echo -en "${IYellow}**** Step 2/7 **** Run HomeBrew upgrade.. ${Color_Off}"
	brew upgrade > $runmode
	brew cask upgrade > $runmode
	if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
	#homeBrew + Cask cache cleaning
	echo -en "${IYellow}**** Step 3/7 **** Clear HomeBrew cache.. ${Color_Off}"
	brew cleanup > $runmode
	rm -f -r /Library/Caches/Homebrew/* > $runmode
	if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
fi

#Atom upgrade without confirm
if ! [ -x "$(command -v apm)" ]
then
  echo -e "${IRed}SKIP Step 4/7 **** APM/ATOM not installed ( https://atom.io/ )${Color_Off}"
else
	echo -en "${IYellow}**** Step 4/7 **** Run Atom upgrade.. ${Color_Off}"
	apm upgrade -c false > $runmode
	if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
fi

#NPM & packages upgrade
if ! [ -x "$(command -v npm)" ]
then
  echo -e "${IRed}SKIP Step 5/7 **** NPM not installed ( https://www.npmjs.com/ )${Color_Off}"
else
	echo -en "${IYellow}**** Step 5/7 **** Run NPM update.. ${Color_Off}"
	npm set progress=false
	#
	# Temporaly removed NPM upgrade because hit an error and disable npm! :(
	# Need to be FIXED!
	#
	# npm update -gq > $runmode
	#
	echo -e "${IRed}skipped due to an upgrade error (see readme!)${Color_Off}";
	npm set progress=true
	if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
fi

#upgrading MAS
if ! [ -x "$(command -v mas)" ]
then
  echo -e "${IRed}SKIP Step 6/7 **** MAS not installed ( https://github.com/mas-cli/mas )${Color_Off}"
else
	echo -en "${IYellow}**** Step 6/7 **** Check Mac App Store upgrades: ${IPurple}insert your Apple ID pass if required.. ${Color_Off}"
	mas upgrade > $runmode
	if [ $runmode == "/dev/null" ]; then echo -e "${IGreen}done!${Color_Off}"; else echo -e ""; fi
fi

#system updates
if ! [ -x "$(command -v softwareupdate)" ]
then
  echo -e "${IRed}SKIP Step 7/7 **** SOFTWAREUPDATE not installed ( strange, it should be installed by default.. )${Color_Off}"
else
	echo -e "${IYellow}**** Step 7/7 **** Check Mac OS upgrades: ${IPurple}insert your super-user pass if required.. ${Color_Off}"
	sudo softwareupdate -ia > $runmode
fi

#finish!
echo -e "${IGreen}****** End! ******${Color_Off}"
