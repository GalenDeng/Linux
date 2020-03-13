

* sudo vim /etc/ssh/sshd_config  
* `修改下面的变量如下` 
```
ClientAliveInterval 30
ClientAliveCountMax 1800
```
* service sshd restart  // 重启sshd服务