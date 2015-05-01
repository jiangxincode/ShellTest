#!/bin/sh

# modified by jiangxin

i=1
while [ $i -le 50 ]
do
	if [ -d /userdata ];then
		sudo mkdir -p -m 754 /userdata/user$i
		# -p 是递归建立目录
		# 加上-m 754 就不用写下面那一句
		# chmod 754 /userdata/user$i
		echo "user$i"
		i=$((i+1));
	else
		sudo mkdir /userdata
		sudo mkdir -p -m 754 /userdata/user$i
		#chmod 754 /userdata/user$i
		echo "user$i"
		i=$((i+1));
	fi
done
