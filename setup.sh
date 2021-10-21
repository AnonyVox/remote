#!/bin/bash

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Environment Check

if [ -d "/data/data/com.termux/files/home"  ];then

echo ${RED}"This Tool is For Debian/Kali/Ubuntu only"
echo ${RED}"Please upgrade from Termux"
exit 0
fi

## Installing Metasploit
	clear

	if [[ `command -v msfconsole` && `command -v java` && `command -v apktool` && `command -v zipalign` ]]; then

	echo ${GREEN}"Dependencies Already Installed"
	sleep 5
	echo ${WHITE}"..."
	chmod +x .remote/remote && cp -r .remote/remote /usr/bin/ && cp -r key.jsk $HOME

	else

	echo ${GREEN}"Installing Metasploit-Framework and Dependencies"
	echo ${WHITE}"..."
	sleep 5
	apt update && apt install curl -y &&  curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
	chmod 755 msfinstall && \
	./msfinstall && apt install apktool default-jdk zipalign -y && chmod +x .remote/remote 
	cp -r .remote/remote /usr/bin/ && cp -r key.jsk $HOME
	sleep 3

	fi

echo ${ORANGE}"Tool Setup Complete..."
echo ""
sleep 4
echo "To open and use the remote tool type ${BLUE}remote${ORANGE}"
sleep 10
exit 0

## Setup for remote
