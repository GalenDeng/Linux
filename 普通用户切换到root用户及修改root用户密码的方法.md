## 普通用户切换到root用户及修改root用户密码的方法 (2017.11.2)
1. `普通用户切换到root用户`
```
galen@galen-virtual:~$ sudo -i
[sudo] password for galen: 
root@galen-virtual:~# 
```
2. `若不知道root的初始密码，执行以下命令进行修改密码操作`
```
root@galen-virtual:~# passwd root
Enter new UNIX password: 
Retype new UNIX password: 
passwd: password updated successfully
root@galen-virtual:~# 
```