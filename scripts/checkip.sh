#!/bin/bash
# Written as a quick aggregate utility to measure statistics and information when first 
# connecting to a new network and assuming another public facing IP from vpn/tor/wifi/etc
# or confirming diagnostic information.
# Some comments found throughout, some depends
# TODO: Map deps, expand comments
# * Usage: [-hgf] [-h help] [-g geoip lookup] [-f full lookup with geoip whois ping nmap] *

OPTIND=1         # Reset in case getopts has been used previously in the shell.
red='\033[0;31m'
NC='\033[0m' # No Color

if [ -z "$*" ]
then
	curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'
	exit 0

fi


function full_run {
        echo -e "* ${red}Getting External IP Address from checkip.dyndns.org... ${NC}"
        ip=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//' )
        echo "$ip"
	echo -e "* ${red}Running GeoIP Lookup... ${NC}"
        geoiplookup $ip
        echo -e "* ${red}Running whois... ${NC}"
        whois $ip
	echo -e "* ${red}Send 10 ICMP Packets... ${NC}"
	ping -i .2 -c 10 $ip
	echo -e "* ${red}Running nmap --script=banner -Pn -sV ${NC}"
	nmap --script=banner -Pn -sV $ip
}


function geo_run {
        echo -e "* ${red}Getting External IP Address from checkip.dyndns.org... ${NC}"
        ip=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//' )
        echo "$ip"
        echo -e "* ${red}Running GeoIP Lookup... ${NC}"
        geoiplookup $ip
}




while getopts "hfg" opt; do
    case "$opt" in
    h)
        echo  "`basename ${0}` Usage: [-hgf] [-h help] [-g geoip lookup] [-f full lookup with geoip whois ping nmap] "
        exit 0
        ;;
    f)
	full_run
        exit 0
	;;
    g)
	geo_run
	exit 0
	;;
    \?)
      echo "Invalid option: -$OPTARG"
      exit 1
	;;

    esac
done




