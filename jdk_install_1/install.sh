echo "正在创建/usr/lib/jvm/目录"
sudo mkdir /usr/lib/jvm/
echo "目录/usr/lib/jvm/创建成功"

echo "正在解压缩jdk-7u51-linux-i586.tar.gz"
tar -zxvf jdk-7u51-linux-i586.tar.gz
echo "解压缩成功"

echo "正在将jdk1.7.0_51/目录复制到/usr/lib/jvm/jdk1.7.0_51/"
sudo cp -r -p jdk1.7.0_51/ /usr/lib/jvm/jdk1.7.0_51/
echo "复制成功"

echo "配置环境变量"
# touch environment  
# echo "PATH=\"$PATH:/usr/lib/jvm/jdk1.7.0_51/bin\"" >> environment
# echo "JAVA_HOME=/usr/lib/jvm/jdk1.7.0_51" >> environment
# echo "CLASSPATH=.:%JAVA_HOME%/lib/dt.jar:%JAVA_HOME%/lib/tools.jar" >> environment
# sudo mv /etc/environment /etc/environment.backup.java
# sudo mv environment /etc
# source /etc/environment

mv ~/.bashrc ~/.bashrc.backup.java
cat ~/.bashrc.backup.java >> ~/.bashrc
echo "PATH=\"$PATH:/usr/lib/jvm/jdk1.7.0_51/bin\"" >> ~/.bashrc
echo "JAVA_HOME=/usr/lib/jvm/jdk1.7.0_51" >> ~/.bashrc
echo "CLASSPATH=.:%JAVA_HOME%/lib/dt.jar:%JAVA_HOME%/lib/tools.jar" >> ~/.bashrc
source ~/.bashrc
echo "配置环境成功"

echo "设置默认jdk"
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java/jdk1.7.0_51/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java/jdk1.7.0_51/bin/javac 300
sudo update-alternatives --config java
echo "设置默认jdk成功"

echo "清理临时文件"
rm -rf jdk1.7.0_51/
echo "清理完成"

echo "测试是否安装成功"
java -version
echo "安装成功"

