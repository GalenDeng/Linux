## linux下安装nomachine以及选择某个shell的rc文件设置别称 （2017.11.07）
1. 去nomachine的官方网站进行相应版本的下载
* wget http://download.nomachine.com/download/5.3/Linux/nomachine_5.3.12_10_x86_64.tar.gz
2. 按照官方版本的安装方法进行安装，也可以选择自己喜欢的安装路径
3. 如果觉得启动nomachine的命令有点长，可以设置命令别称,存进你想要的shell的rc文件中 
```
example:
 nomachine的启动命令： /usr/local/src/NX/bin/nxplayer
 在 .bashrc设置：  alias nxplayer='/usr/local/src/NX/bin/nxplayer'
```
4. source使到.bashrc文件改变生效
* source .bashrc