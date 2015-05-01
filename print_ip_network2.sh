#!/bin/bash

# modified by jiangxin
# This script print ip and network

# if your OS is English edition,
# you should uncomment the followings 
# IP=`ifconfig eth0 |grep 'inet ' |sed 's/^.*addr://g'|sed 's/ Bcast.*$//g'`
# NETMASK=`ifconfig eth0 |grep 'inet ' |sed 's/^.*Mask://g'`

# if your OS is Chinese edition,
# you should uncomment the followings 
IP=`ifconfig eth0 |grep 'inet ' |sed 's/^.*地址://g'|sed 's/ 广播.*$//g'`
NETMASK=`ifconfig eth0 |grep 'inet ' |sed 's/^.*掩码://g'`

echo "$IP/$NETMASK"
exit
