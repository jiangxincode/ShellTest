#/bin/sh

# 将当前目录下大于10K的文件转移到/tmp目录下
# modified by jiangxin

for fileName in `ls -l | awk '$5>10240 {print $9}'`
# shell script要求把command放在``中，awk的作用是分子段处理数据
# $0代表整行，$1代表每一行第一个字段,$2代表每一行第二个字段，以此类推
# $5代表文件或文件夹的大小，$9代表文件或文件夹的名称
do
    sudo mv $fileName /tmp
done

ls -al /tmp
echo "Done! "
