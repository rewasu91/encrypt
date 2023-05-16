#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")
#########################

encryptReqv1() {
	echo -e "\033[0;34mPLEASE INPUT YOUR TARGET PATH\033[0m"
	echo -e "\033[0;34mIF USE DEFAULT PATH , JUST CLICK ENTER\033[0m"
	echo ""
	echo -ne "DIRECTORY [default: \E[44;1;39m/root/kaizenvpnenc\E[0m] : "
	read dir
	[[ -z $dir ]] && dir="/root/kaizenvpnenc"
	ls -d $dir/*/ >/root/kaizenvpndir
	ls -d $dir/*/*/ >>/root/kaizenvpndir
	a=$(cat /root/kaizenvpndir)
	for b in $a; do
		ls $b*.sh >>/root/kaizenvpndirfile
		clear
	done
	ls $dir/*.sh >/root/kaizenvpnencfile
	auto=$(cat /root/kaizenvpnencfile)
	encdir=$(cat /root/kaizenvpndirfile)
	for encc in $encdir; do
		shc -r -f $encc
	done
	for nama in $auto; do
		shc -r -f $nama
		cd $dir
		for file in *.sh.x; do
			mv "$file" "${file/.sh.x/.sh}"
		done
	done
	for clear in $a; do
		rm -f $clear*.c
		for fidir in $clear*.x; do
			mv "$fidir" "${fidir/.sh.x/.sh}"
		done
	done
	rm -f /$dir/*.c
	rm -f /root/kaizenvpndir
	rm -f /root/kaizenvpnencfile
	rm -f /root/kaizenvpndirfile
	clear
	echo -e '\e[0;32mDONE ENCRYPT\033[0m'
	echo -e ''
	echo -e "YOUR ENCRYPTED FILE PATH : $dir"
	read -n 1 -s -r -p "Press any key to back on menu"

	enc
}

encryptReqv2() {
	echo -e "\033[0;34mPLEASE INPUT YOUR TARGET PATH\033[0m"
	echo -e "\033[0;34mIF USE DEFAULT PATH , JUST CLICK ENTER\033[0m"
	echo ""
	echo -ne "DIRECTORY [default: \E[44;1;39m/root/kaizenvpnenc\E[0m] : "
	read dir
	[[ -z $dir ]] && dir="/root/kaizenvpnenc"
	ls -d $dir/*/ >/root/kaizenvpndir
	ls -d $dir/*/*/ >>/root/kaizenvpndir
	a=$(cat /root/kaizenvpndir)
	for b in $a; do
		ls $b*.sh >>/root/kaizenvpndirfile
		clear
	done
	ls $dir/*.sh >/root/kaizenvpnencfile
	auto=$(cat /root/kaizenvpnencfile)
	encdir=$(cat /root/kaizenvpndirfile)
	for encc in $encdir; do
		shc -r -v -f $encc
	done
	for nama in $auto; do
		shc -r -v -f $nama
		cd $dir
		for file in *.sh.x; do
			mv "$file" "${file/.sh.x/.sh}"
		done
	done
	for clear in $a; do
		rm -f $clear*.c
		for fidir in $clear*.x; do
			mv "$fidir" "${fidir/.sh.x/.sh}"
		done
	done
	rm -f /$dir/*.c
	rm -f /root/kaizenvpndir
	rm -f /root/kaizenvpnencfile
	rm -f /root/kaizenvpndirfile
	clear
	echo -e '\e[0;32mDONE ENCRYPT\033[0m'
	echo -e ''
	echo -e "YOUR ENCRYPTED FILE PATH : $dir"
	read -n 1 -s -r -p "Press any key to back on menu"

	enc
}

MYIP=$(curl -sS ipv4.icanhazip.com)
client=$(curl -sS https://raw.githubusercontent.com/rewasu91/encrypt/main/allow | grep $MYIP | awk '{print $2}')
exp=$(curl -sS https://raw.githubusercontent.com/rewasu91/encrypt/main/allow | grep $MYIP | awk '{print $3}')
yell='\e[1;33m'
NC='\e[0m'
if [ ! -f /usr/bin/zip ]; then
	apt install zip -y &>/dev/null
	apt install git -y &>/dev/null
fi
if [ ! -d /root/kaizenvpnenc ]; then
	mkdir /root/kaizenvpnenc
else
	echo -ne "[ ${yell}WARNING${NC} ] Do you want to Clear Encrypt Folder ? (y/n)? "
	read answer
	if [ "$answer" == "${answer#[Yy]}" ]; then
		echo ""
	else
		rm -rf /root/kaizenvpnenc/*
	fi
fi
clear
echo -e "\033[0;34m\033[0m"
echo -e "\E[44;1;39m                ENCRYPT MENU                  \E[0m"
echo -e "\033[0;34m\033[0m"
echo -e ""
echo -e "[\033[0;32m01\033[0m]  ENCRYPT V1        [\033[0;32m02\033[0m] ENCRYPT V2"
echo -e ""
echo -e "\033[0;34m\033[0m"
echo -e "Client Name   : $client"
echo -e "Expiry script : $exp"
echo -e "\033[0;34m\033[0m"
echo -e ""
echo -ne "Select menu : "
read x

case "$x" in
1 | 01)
	clear
	encryptReqv1
	;;
2 | 02)
	clear
	encryptReqv2
	;;
*)
	clear
	enc
	;;
esac