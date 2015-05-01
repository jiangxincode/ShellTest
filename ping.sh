#!/bin/bash
# 此脚本只是快速查看所在局域网中其它主机的IP地址，如果对方设置了禁ping，则无法显示出此主机的IP地址
for i in `seq 1 254`
do
	{
		ping -c2 192.168.221.$i &>/dev/null && echo "192.168.221.$i is alive"
	}&
done
wait
