#!/bin/bash

# /var/cache/apt/archives/ 文件要在重装系统前备份下来，除非你想下次重装再从网上慢悠悠的下软件。

# 这个命令用于删除当前目录及子目录下所有名称中包含kopete字样的文件。因为用apt-get remove删软件，软件的配置文件还会遗留在主文件，这个命令就可以把它们统统清除干净。
# find . -name *kopete* -exec rm -rf {} \;




#-------------------------------------------
#---------     删除一些没用的软件       ------------
#-------------------------------------------

# sudo apt-get remove * -y终端y指对于所有提示均回答y
#Ekiga 软电话
sudo apt-get remove ekiga -y
#电影播放机
sudo apt-get remove totem totem-gstreamer totem-mozilla -y
#Rhythmbox 音乐播放器
sudo apt-get remove rhythmbox -y
#Bittorrent
sudo apt-get remove bittorrent -y

#-------------------------------------------
#---------     添加新的软件源     ---------------------
#-------------------------------------------

#加入一个软件源
# 你需要根据你的版本号重新修改软件源的配置
# 
(
# 以追加方式加入源
echo '$a'; 
echo '## 江苏常州电信';
echo 'deb http://ubuntu.cn99.com/ubuntu/ feisty main restricted universe multiverse';
echo 'deb http://ubuntu.cn99.com/ubuntu/ feisty-security main restricted universe multiverse';
echo 'deb http://ubuntu.cn99.com/ubuntu/ feisty-updates main restricted universe multiverse';
echo 'deb http://ubuntu.cn99.com/ubuntu/ feisty-proposed main restricted universe multiverse';
echo 'deb http://ubuntu.cn99.com/ubuntu/ feisty-backports main restricted universe multiverse';
echo 'deb-src http://ubuntu.cn99.com/ubuntu/ feisty main restricted universe multiverse';
echo 'deb-src http://ubuntu.cn99.com/ubuntu/ feisty-security main restricted universe multiverse';
echo 'deb-src http://ubuntu.cn99.com/ubuntu/ feisty-updates main restricted universe multiverse';
echo 'deb-src http://ubuntu.cn99.com/ubuntu/ feisty-proposed main restricted universe multiverse';
echo 'deb-src http://ubuntu.cn99.com/ubuntu/ feisty-backports main restricted universe multiverse';
echo 'deb http://ubuntu.cn99.com/ubuntu-cn/ feisty main multiverse restricted universe';
echo '.'; echo 'wq') | sudo ed -s /etc/apt/sources.list
# -s表示以silent方式进行


#从新获取软件源的信息
sudo apt-get update
#更新升级已安装的软件
sudo apt-get upgrade

#如果你所在的地方访问常州电信很慢，可以试试上海和杭州的
#上海电信
#deb http://mirror.rootguide.org/ubuntu/ feisty main restricted universe multiverse
#deb-src http://mirror.rootguide.org/ubuntu/ feisty main restricted universe multiverse
#deb http://mirror.rootguide.org/ubuntu/ feisty-updates main restricted universe multiverse
#deb-src http://mirror.rootguide.org/ubuntu/ feisty-updates main restricted universe multiverse
#deb http://mirror.rootguide.org/ubuntu/ feisty-backports main restricted universe multiverse
#deb-src http://mirror.rootguide.org/ubuntu/ feisty-backports main restricted universe multiverse
#deb http://mirror.rootguide.org/ubuntu/ feisty-security main restricted universe multiverse
#deb-src http://mirror.rootguide.org/ubuntu/ feisty-security main restricted universe multiverse
#deb http://mirror.rootguide.org/ubuntu/ feisty-proposed main multiverse restricted universe
#deb-src http://mirror.rootguide.org/ubuntu/ feisty-proposed main restricted universe multiverse
#deb http://mirror.rootguide.org/ubuntu-cn/ feisty main multiverse restricted universe

#浙江杭州电信
#deb http://mirror.lupaworld.com/ubuntu feisty main restricted universe multiverse
#deb http://mirror.lupaworld.com/ubuntu feisty-security main restricted universe multiverse
#deb http://mirror.lupaworld.com/ubuntu feisty-updates main restricted universe multiverse
#deb http://mirror.lupaworld.com/ubuntu feisty-backports main restricted universe multiverse
#deb-src http://mirror.lupaworld.com/ubuntu feisty main restricted universe multiverse
#deb-src http://mirror.lupaworld.com/ubuntu feisty-security main restricted universe multiverse
#deb-src http://mirror.lupaworld.com/ubuntu feisty-updates main restricted universe multiverse
#deb-src http://mirror.lupaworld.com/ubuntu feisty-backports main restricted universe multiverse
#deb http://mirror.lupaworld.com/ubuntu/ubuntu-cn/ feisty main multiverse restricted universe




#-------------------------------------------
#---------     常用软件     ---------------------
#-------------------------------------------

# 安装NTFS读写支持（现在的版本已经不需要了，默认支持ntfs）
# 安装完后，点击“应用程序” - “系统工具” - “NTFS写入支持配置程序”输入密码，选中对内部设备的读写支持，和外部设备的读写支持，系统会自动扫描你硬盘上的NTFS分区，并重新挂载，这样，你的NTFS分区就能在Feisty下完美读写了！
# sudo apt-get install ntfs-config --force-yes -y


#安装StarDict翻译词典
sudo apt-get install stardict stardict-common  --force-yes -y
sudo apt-get install stardict-cdict-gb stardict-cedict-gb stardict-hanzim stardict-langdao-ce-gb stardict-langdao-ec-gb stardict-oxford-gb stardict-xdict-ce-gb stardict-xdict-ec-gb  --force-yes -y

#安装浏览器Flash插件：
sudo mkdir -p /usr/lib/X11/fonts/Type1
sudo apt-get install flashplugin-nonfree --force-yes -y

#安装下载工具Downloader_for_X
sudo apt-get install d4x --force-yes -y
#安装 BT工具
sudo apt-get install azureus --force-yes -y
#安装amule工具
#只要加入以下IP就可以自动将所有的IP列举出来了。名称：DonkeyServer No1 地址：62.241.53.2:4242 
#ED2K服务器列表,在server栏中分批次输入:http://www.emule.org.cn/server.met（VeryCD eMule）
#KAD 更新地址 可以用:http://renololo1.free.fr/e/nodes.dat
#如果需要将 aMule 与 Firefox 浏览器相关联，可以把 network.protocol-handler.app.ed2k 的字符串设置为 /usr/bin/ed2k。 
#然后在Firefox里面关联ed2k链接。
#在地址栏输入about:config
#新建“布尔”  名称：network.protocol-handler.external.ed2k   值：true
#新建“字符串”   名称：network.protocol-handler.app.ed2k   值：/usr/bin/ed2k
#另外，最好将amule的Nick(用户昵称)改成 [CHN][VeryCD]yourname
sudo apt-get install amule amule-utils --force-yes -y


#安装rar支持
sudo apt-get install rar unrar --force-yes -y
#安装编译工具
sudo apt-get install build-essential --force-yes -y
#安装 RSS 新闻阅读器
sudo apt-get install akregator --force-yes -y
#安装FTP工具
sudo apt-get install gftp --force-yes -y
#安装进入终端的右键快捷菜单
sudo apt-get install nautilus-open-terminal --force-yes -y
#alien--把rpm包转换成deb包。使用命令：alien abc.rpm
sudo apt-get install alien --force-yes -y



#AmaroK数字音乐播放器(插放mp3)，被评为linux下十大最受欢迎软件之一。
#把列表显示列只选择文件名，即可简单的解决播放列表显示乱码的问题。
sudo apt-get install amarok --force-yes -y
#安装视频播放软件和相应解码器
sudo apt-get install mplayer mozilla-mplayer libxine-extracodecs w32codecs --force-yes -y
sudo apt-get install gstreamer0.10-plugins-ugly gstreamer0.10-pitfdll gstreamer0.10-ffmpeg --force-yes -y

#mplayer操作说明： F = 全屏，P = 暂停/开始，O = 显示/隐藏播放时间，ALT+方向键 = 播放进度

#配置mplayer
(echo '$a'; 
echo 'ao=alsa #音频驱动选择'; 
echo 'vo=x11 #视频驱动选择';
echo 'joystick=0 #是否支持手柄控制';
echo 'stop-xscreensaver=yes #是否允许播放视频时出现屏保'; 
echo 'monitoraspect=1280:800 #识别桌面分辨率为1280×800'; 
echo 'zoom=yes #是否允许视频缩放'; 
echo 'subcp=cp936 #字幕字符集编码'; 
echo 'subfont-autoscale=1 #设置按什么方法来进行自动缩放字幕，0－不自动缩放，1－按电影高度缩放，2－按电影宽度缩放，3－按电影对角线缩放(默认值)'; 
echo 'subfont-text-scale=5 #设置字幕文本的自动缩放系数(屏幕尺寸的百分比)，值范围为0～100，默认值为5。'; 
echo 'subfont-osd-scale=8 #OSD字幕的自动缩放系统(屏幕尺寸的百分比)，值范围为0～100，默认值为6。'; 
echo 'font=/usr/share/fonts/zh_CN/msyh.ttf #选择字幕用的字体'; 
echo 'overlapsub=1 #支持多语言字幕。'; 
echo 'sub-fuzziness=1 #设定字幕自动加载的识别，播放时可以通过j键切换。'; 
echo 'osdlevel=1 #OSD类型，0不显示；1只显示进度(仅在快进快退时)；2显示播放时间；3显示播放时间和剩余时间'; 
echo 'cache = 8192 #此选项指定用多少内存(以 kBytes 为单位)作为播放文件或 URL 的预缓冲';
echo '.'; echo 'wq') | ed -s ~/.mplayer/config



#安装中文输入法：fcitx （注：装好后在会话里加一个启动项：fcitx，除非你想每次用都打fcitx命令）
#修改配置文件 ~/.fcitx/config
#主窗口隐藏模式=1                   #解决登录和观看影片时状态栏问题 
#输入条是否居中=0                   #不想输入条每次都到中间去 
#输入条偏移量X=9         #输入窗口离开得远一些
#输入条偏移量Y=22
#候选词个数=9
sudo apt-get install im-switch fcitx libapt-pkg-perl --force-yes -y
#切换输入法
sudo im-switch -s fcitx



#阅读CHM文件，chmsee对某些不规范的chm文件支持效好， gnochm支持搜索
sudo apt-get install chmsee gnochm --force-yes -y
#Linux下的QQ客户端--eva
sudo apt-get install eva --force-yes -y
#解决在eva无法使用scim输入法的问题(如果用fcitx输入法，此步可省)
sudo apt-get install scim-qtimm --force-yes -y
#安装 Pidgin.Gaim 已经改名为 Pidgin
sudo apt-get install pidgin --force-yes -y
#桌面搜索，功能类似于GOOGLE的那个桌面搜索。安装后在“附件”菜单可找到一个“搜索”项
sudo apt-get install beagle --force-yes -y


#cpufrequtils－－调节CPU频率
#监视cpu频率：右键单击面板，选择“添加到面板”，里面找到“cpu频率范围监视器”。
sudo apt-get install cpufrequtils --force-yes -y
sudo cpufreq-set -g ondemand
#    执行cpufreq-info可看到CPU所支持的模式，大致有如下几种：
#    powersave，是无论如何都只会保持最低频率的所谓“省电”模式；
#    userspace，是自定义频率时的模式，这个是当你设定特定频率时自动转变的；
#    ondemand，一有cpu计算任务，立即达到最大频率，执行完毕立即回到最低频率
#    conservative，保守模式（默认），一般选择这个，会自动在频率上下限调整；
#    performance，顾名思义只注重效率，无论如何一直保持以最大频率运行。 

#监视CPU温度：
#添加到面板的项的名字叫“Hardware sensors monitor"
sudo apt-get install sensors-applet --force-yes -y





#-------------------------------------------
#---------     编程类软件     -------------------
#-------------------------------------------
#开发JAVA程序的JDK环境(如果仅是运行Java程序，可用sun-java6-jre)
sudo apt-get install sun-java6-jdk --force-yes -y
#安装浏览器的JAVA Plugin
sudo apt-get install sun-java6-plugin --force-yes -y
#安装MySQL
sudo apt-get install mysql-server mysql-client --force-yes -y
#root原密码为空，给它加个密码
mysqladmin -uroot password 123456
#重启动mysql服务（此步可省）
mysqladmin -uroot -p123456 shutdown
sudo mysqld&

#和Visio类似的dia（默认只能在命令行启动）
sudo apt-get install dia --force-yes -y
#画UML图的umbrello
sudo apt-get install umbrello --force-yes -y




#-------------------------------------------
#---------     字体            ---------------------
#-------------------------------------------

#Arial, Tahoma, Times New Roman都是显示网页很重要的字体
sudo apt-get install msttcorefonts --force-yes -y

#将Lucida Grande字体复制到~/.fonts/，用“系统->首选项->字体”把字体调整成Lucida Grande，最后一个等宽调整为Lucida Console。
#这时显示效果肯定很糟糕，我们需要把autohinting打开。在你的用户目录下添加一个文件
rm ~/.fonts.conf
echo '<?xml version="1.0"?>' >> ~/.fonts.conf
echo '<!DOCTYPE fontconfig SYSTEM "fonts.dtd">' >> ~/.fonts.conf
echo '<fontconfig>' >> ~/.fonts.conf
echo '  <match target="font">' >> ~/.fonts.conf
echo '    <test compare="more" name="pixelsize" qual="any">' >> ~/.fonts.conf
echo '      <double>12</double>' >> ~/.fonts.conf
echo '    </test>' >> ~/.fonts.conf
echo '    <edit name="autohint" mode="assign" >' >> ~/.fonts.conf
echo '      <bool>true</bool>' >> ~/.fonts.conf
echo '    </edit>' >> ~/.fonts.conf
echo '  </match>' >> ~/.fonts.conf
echo '</fontconfig>' >> ~/.fonts.conf

#重新登录，字体显示应该好了不少。不过我们还没完成，如果仔细观察，小字体的显示还是颇为模糊。幸运的是现在有人提供了加上patch的这几个包的repository，我们可以很方便地安装：

#sudo gedit /etc/apt/sources.list 
#加上这两行（如果加了常州电信的源，此步可省）
#deb http://www.telemail.fi/mlind/ubuntu feisty fonts
#deb-src http://www.telemail.fi/mlind/ubuntu feisty fonts

#然后在命令行下，下载gnp key：
wget http://www.telemail.fi/mlind/ubuntu/937215FF.gpg -O- | sudo apt-key add -

#（似乎之前已经安装过了）
sudo apt-get install libfreetype6 libcairo2 libxft2


#最后动一下字体设置，我用的是(Autohinting->Always->No bitmaps），这个命令需要回答问题。
sudo dpkg-reconfigure fontconfig-config
sudo dpkg-reconfigure fontconfig
#退出重新登录，字体是不是清晰了很多？注意你浏览器地址栏里的“www“，斜线没有了毛边。 


#安装PDF阅读器－－Acrobat7.0
#虽然ubuntu自带的文档查看器可以看PDF，但有些PDF文件不太规范，从而导致乱码。这时就需要用官方的 Acrobat了，不过这个软件较大，启动也较慢。
sudo apt-get install acroread --force-yes -y
#再下载其中文语言包
#wget http://download.adobe.com/pub/adobe/reader/unix/7x/7.0.8/misc/FontPack708_chs_i386-linux.tar.gz
#tar zxvf FontPack708_chs_i386-linux.tar.gz
#解压后，运行其中的INSTALL
#sudo ./INSTALL
#我事先把FontPack708_chs_i386-linux.tar.gz解压到acrobat7_cn目录
sudo /var/cache/apt/archives/acrobat7_cn/INSTALL
#第一问题问你是否继续安装，直接回车；
#第二个问题问你是否接受协议，键入accept后回车；
#第三个问题要你定义Acrobat的安装目录，输入/usr/lib/Adobe/Acrobat7.0后回车。

