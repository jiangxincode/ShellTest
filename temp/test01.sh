#!/bin/bash
echo User: $USER 
echo UID:$UID
echo HOME:$HOME
today=`date +%y%m%d`
# ls -l /home/jiangxin/test > ~/test/$today.log
var1=100
var2=40
var3=$[$var1/$var2]
echo The final result is $var3
var3=`echo "scale=4;$var1/$var2" | bc`
echo The final result is $var3
# 将当前目录下大于10K的文件转移到/tmp目录下
#/bin/sh
# by jiangxin

for FileName in `ls -l | awk '$5>1024 {print $9}'`
# shell script要求把command放在``中，awk的作用是分子段处理数据
# $0代表整行，$1代表每一行第一个字段,$2代表每一行第二个字段，以此类推
# $5代表文件或文件夹的大小，$9代表文件或文件夹的名称
do
sudo mv $FileName /tmp/jiangxin
done
ls -al /tmp/jiangxin
echo "Done! "

