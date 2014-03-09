echo "正在删除/usr/lib/jvm/目录"
sudo rm -rf /usr/lib/jvm/
wait
echo "删除/usr/lib/jvm/目录成功"

echo "恢复配置文件"
# sudo rm -f /etc/environment
# sudo mv /etc/environment.backup.java /etc/environment
rm  ~/.bashrc
mv ~/.bashrc.backup.java ~/.bashrc
echo "恢复配置文件成功"
