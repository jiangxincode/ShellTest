+ install.sh:
该shell script适合ubuntu新手用来在安装ubuntu之后快速的实现一个适合自己的软件环境。你可以运行该脚本，该脚本会实现无人监管的软件安装。
如果你已经熟悉了ubuntu的使用，但有些情况下你可能仍需要重装系统，那么这个脚本也是适合你的，你可以修改一下这个脚本中的内容，然后构建出专属与你自己的install.sh。但是当你需要重装系统时请注意一下几点：
（1）为了重装方便，最好备份一下“主文件夹”，里面全是各个软件的配置。

+ move.sh
将当前目录下大于10K的文件转移到/tmp目录下

+ print_ip_network1.sh
获取本机的网络地址（方法一）
比如：本机的ip地址是：192.168.100.2/255.255.255.0，那么它的网络地址是
192.168.100.2/255.255.255.0
此方法仅适用于redhat系列linux系统

+ print_ip_network2.sh
获取本机的网络地址（方法二）
比如：本机的ip地址是：192.168.100.2/255.255.255.0，那么它的网络地址是
192.168.100.2/255.255.255.0
此方法仅适用于大部分linux系统

+ httpd.sh
Start/stop/restart the Apache web server.

+ make_dir.sh
在/userdata目录下建立50个目录，即user1～user50，并设置每个目录的权限:
其他用户的权限为：读；
文件所有者的权限为：读、写、执行；
文件所有者所在组的权限为：读、执行。

+ jdk_install_1
包括两个脚本，详见对应文件夹中的README

+ jdk_install_2
详见对应文件夹中的README

+ jdk_install_3
详见对应文件夹中的README

+ add_users.sh
Add a new group named class1, then add thirty users named stu01-stu30 to this group.

+ delete_users.sh
Delete 30 users named stu01-stu30 which group is class1, and then delete the group class1.

+ jieya.ph
a python script
 
+ rename.sh
Rename a group of files from a filetype to another.
(for example:*.c->*.cpp)
思路如下：
1、查找出相应扩展名的文件
2、去除扩展名
3、使用awk将要进行的操作以字符串命令形式组合
4、将组合完毕的字符串传递给shell执行