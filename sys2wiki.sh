#!/bin/bash
# FROM http://wiki.splitbrain.org/sys2wiki.sh

# 为了使脚本正确运行，将语系设置为通用 C
LANG=C

# 指定不同输出部分以 HL 输出
HL='===='

# 将从 /proc/cpuinfo 获得的 CPU 型号信息存于变量 CPU 中
CPU=`cat /proc/cpuinfo | grep 'model name' | awk -F\: '{print $2}'|uniq|sed -e 's/ //'`

# 将从 /proc/cpuinfo 获得的 CPU 频率信息存于变量 MHz 中
MHz=`cat /proc/cpuinfo | grep 'cpu MHz' | awk -F\: '{print $2}'|uniq|sed -e 's/ //'`

# 将从 /proc/cpuinfo 获得的 CPU 个数信息存于变量 CPUCOUNT 中
CPUCOUNT=`cat /proc/cpuinfo|grep "physical id"|uniq|wc -l`

# 将从 /proc/cpuinfo 获得的 CPU 核数信息存于变量 CPUKENELCOUNT 中
CPUKENELCOUNT=`cat /proc/cpuinfo|grep "processor"|uniq|wc -l`

# 将从 /proc/meminfo 获得的物理内存数量存于变量 RAM 中
RAM=`cat /proc/meminfo | grep MemTotal | awk -F\: '{print $2}' | awk -F\ '{print $1 " " $2}'`

# 将从 /proc/meminfo 获得的虚拟内存数量存于变量 SWAP 中
SWAP=`cat /proc/meminfo | grep SwapTotal | awk -F\: '{print $2}' | awk -F\ '{print $1 " " $2}'`

# 将操作系统类型信息存于变量 SYSTEM 中
SYSTEM=`uname -sr`

# 将计算机名存于变量 HOSTNAME 中
HOSTNAME=`(hostname -f || hostname) 2>/dev/null`

# 将操作系统发型版信息存于变量 OS 中
if [ -e /etc/debian_version ]; then
	OS="Debian `cat /etc/debian_version`"
elif [ -e /etc/redhat-release ]; then
	OS=`cat /etc/redhat-release`
elif [ -e /etc/SuSE-release ]; then
	OS=`cat /etc/SuSE-release |head -n1`
elif [ -e /etc/gentoo-release ]; then
	OS=`< /etc/gentoo-release`
else
	OS='unknown'
fi

# 打印常规信息
echo "

# 打印常规信息标题
$HL General $HL

#  以表格形式打印上面收集的信息变量
^ Hostname | $HOSTNAME |
^ CPU	| $CPU	|
^ MHz	| $MHz	|
^ # CPU	| $CPUCOUNT |
^ # CPUKENEL | $CPUKENELCOUNT |
^ RAM	| $RAM	|
^ Swap	| $SWAP	|
^ System	| $SYSTEM	|
^ OS	| $OS	|
"
# 打印网络信息标题
echo -e "$HL Network $HL\n"

# 以 for 循环用表格形式打印各个网络接口及 IP
for DEV in `/sbin/ifconfig -a | grep '^\w'|awk '!/lo/{print $1}'`
do
	IP=`/sbin/ifconfig $DEV |awk -F\: '/inet / {print $2}'|awk '{print $1}'` echo "^ $DEV | $IP |"
done

# 打印空行
echo

# 打印PCI设备信息标题
echo -e "$HL PCI $HL\n"

# 将 lspci 命令输出的每一行前加两个空格，即以CODE方式显示 lspci 命令的输出
lspci |sed 's/^/ /'

# 打印空行
echo

# 打印文件系统信息标题
echo -e "$HL Filesystems $HL\n"

# 以表格方式打印除了 tmpfs 之外所有文件系统的信息
# （包括： Filesystem、Type、Size、Mounted 四项信息）
df -hPT -x tmpfs | awk '{print "| " $1 " | " $2 " | " $3 " | " $7 " |"}'
echo

# 打印IDE设备信息标题
echo -e "$HL IDE devices $HL\n"

# 以 for 循环用表格形式输出每一个 IDE 设备的信息
for DEV in `ls -1d /proc/ide/hd* |sed 's/.*\///'`
do
	MODEL=`cat /proc/ide/$DEV/model`
	# 由于不同的Linux发布系统记录设备大小的文件不同
	# 因此使用下面的 if 嵌套语句进行判断
	if [ -e /proc/ide/$DEV/capacity ]; then
		SIZE=`cat  /proc/ide/$DEV/capacity`
		SIZE=`expr $SIZE / 2097152`
	else
		if [ -e /sys/block/$DEV/size ]; then
			SIZE=`cat /sys/block/$DEV/size`
			SIZE=`expr $SIZE / 2097152`
		else
			SIZE='(unknown)'
		fi
	fi
	
	echo "| /dev/$DEV | $MODEL | $SIZE GB |"
done

# 当 /sys/block/sd* 存在时
if [ "$(ls -1d /sys/block/sd* 2> /dev/null)" ]; then
	# 打印SCSI设备信息标题
	echo -e "$HL SCSI devices $HL\n"
	# for 循环用表格形式输出每一个 SCSI 设备的信息
	for DEV in `ls -1d /sys/block/sd* |sed 's/.*\///'`
	do
		MODEL=`cat  /sys/block/$DEV/device/model`
		SIZE=`cat /sys/block/$DEV/size`
		SIZE=`expr $SIZE / 2097152`
		
		echo "| /dev/$DEV | $MODEL | $SIZE GB |"
	done
	echo
fi
