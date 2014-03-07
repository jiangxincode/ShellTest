#!/bin/sh 定义实用的shell
#
# /etc/rc.d/rc.httpd
#
# Start/stop/restart the Apache web server.
#
# To make Apache start automatically at boot, make this
# file executable: chmod 755 /etc/rc.d/rc.httpd
#
#case结构开始，判断“位置参数”决定执行的操作。本程序携带一个“位置参数”，即$1
case "$1" in
'start') #若位置参数为start
/usr/sbin/apachectl start ;; #启动httpd进程
'stop') #若位置参数为stop
/usr/sbin/apachectl stop ;; #关闭httpd进程
'restart') #若位置参数为stop
/usr/sbin/apachectl restart ;; #重新启动httpd进程
*) #若位置参数不是start、stop或restart时
echo "usage $0 start|stop|restart" ;; #显示命令提示信息：程序的调用方法
esac #case结构结束
