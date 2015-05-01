#!/bin/bash

# modified by jiangxin
# This script print ip and network

# if your OS is the redhat and something like it,
# you should uncomment the followings
file="/etc/sysconfig/network-scripts/ifcfg-eth0"

if [ -f $file ] ;then
IP=`grep "IPADDR" $file|awk -F"=" '{ print $2 }'`
MASK=`grep "NETMASK" $file|awk -F"=" '{ print $2 }'`
echo "$IP/$MASK"
exit 1
fi
