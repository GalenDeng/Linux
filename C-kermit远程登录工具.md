## C-kermit远程登录工具 (2017.11.24)
1. `sudo apt-get install ckermit` : `安装`
2. `设置配置`
```
* 
galen@HD66:~$ touch .kermrc         /home/galen的目录下新建该文件
galen@HD66:~$ vim .kermrc 
* 
set line /dev/ttyS0
set speed 115200
set carrier-watch off
set handshake none
set flow-control none
robust
set file type bin
set file name lit
set rec pack 1000
set send pack 1000
set window 5
```
3. `使用`
*  `sudo kermit -c` : `打开串口`
*  `关闭串口`
```
先同时按住“Ctrl”
和“\”键，然后松开再按“C”键，最后输入“exit”并回车
```
*  Linux 中，可以使用 kermit 连接串口以操作目标板
