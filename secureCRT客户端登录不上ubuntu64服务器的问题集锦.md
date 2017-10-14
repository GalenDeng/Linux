## secureCRT客户端登录不上ubuntu64服务器的问题集锦 (2017.10.14)

*注: Ubuntu缺省安装了openssh-client，但没有安装openssh-server*


1. `问题：The remote system refused the connection.`
```
解决方法：

* galen@galen-virtual:~$ sudo apt-get install openssh-server 
* galen@galen-virtual:~$ ps -e | grep ssh      // -e 是显示所有的进程
若看到 sshd 表示 openssh-server启动了
 5384 ?        00:00:00 sshd
 5477 ?        00:00:00 sshd
 5525 ?        00:00:00 sshd
* 若 sshd没有启动,则需要执行 /etc/init.d/ssh start

ssh-server配置文件位于/ etc/ssh/sshd_config，在这里可以定义SSH的服务端口，
默认端口是22，你可以自己定义成其他端口号，如222。然后重启SSH服务：

* $ netstat -tlp 可以查看网络的情况
```