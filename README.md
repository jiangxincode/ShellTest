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

+ jdkinstall.sh/jdkuninstall.sh

如果大家必须在Linux环境下使用java开发应用程序，会感觉Linux下JDK和Eclipse等相关软件安装都很复杂，所以我特意写了一个脚本，这是一个在Linux下自动安装/卸载JDK和Eclipse的脚本，实现一键安装卸载，无任何额外文件产生。大家可以尝试一下。
文件包等下载地址：

	http://pan.baidu.com/s/1sjArVM9

脚本能够自动识别系统是32位的还是64位的，并自动选择Jdk和Eclipse等版本。

+ 测试环境：
	+ Linux发行版本：Ubuntu 14.04
+ JDK版本：
	+ jdk-7u60-linux-i586（32位）
	+ jdk-7u60-linux-x64（64位）
+ Eclipse版本：
	+ eclipse-java-luna-R-linux-gtk（32位）
	+ eclipse-java-luna-R-linux-gtk-x86_64（64位）

使用时请确保此文件夹存在以下文件：

+ eclipse-java-luna-R-linux-gtk.tar.gz
+ eclipse-java-luna-R-linux-gtk-x86_64.tar.gz
+ jdkinstall.sh
+ jdk-7u60-linux-i586.tar.gz
+ jdk-7u60-linux-x64.tar.gz
+ jdkuninstall.sh

你可以尝试修改该脚本以实现更加适合自己等功能，欢迎大家提出修改意见。
部分Linux系统会自带OpenJava，可以在安装前看看java/javac等命令是否有效。
如果该脚本失败请参考另外的jdkinstall2.sh 和 jdkinstall3.sh

+ jdkinstall2.sh


+ jdkinstall3.sh


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
- 查找出相应扩展名的文件
- 去除扩展名
- 使用awk将要进行的操作以字符串命令形式组合
- 将组合完毕的字符串传递给shell执行
