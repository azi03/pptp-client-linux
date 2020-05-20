#!/bin/bash

while true
do
	if ifconfig | grep ppp0 >/dev/null; then
		echo "已成功连接pptp vpn"
	else
		pptpsetup --create pptpd --server ${SERVER} --username ${USERNAME} --password ${PASSWORD} --encrypt --start
		ifconfig ppp0 mtu 1396
		routeArray=(${ROUTES//,/ })  
		for route in ${routeArray[@]}
		do
			ipArray=(${route//:/ })
			route add -net ${ipArray[0]} netmask ${ipArray[1]} dev ppp0
		done
	fi
	sleep 10s
done

