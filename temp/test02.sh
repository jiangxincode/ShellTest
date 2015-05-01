touch environment  
echo "PATH=\"$PATH:/usr/lib/jvm/jdk1.7.0_51/bin\"" >> environment  
echo "JAVA_HOME=/usr/lib/jvm/jdk1.7.0_51" >> environment  
echo "CLASSPATH=.:%JAVA_HOME%/lib/dt.jar:%JAVA_HOME%/lib/tools.jar" >> environment

rm -rf /etc/environment  
cp environment /etc  
source /etc/environment
