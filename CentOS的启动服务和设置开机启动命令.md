## CentOS的启动服务和设置开机启动命令 (2017.11.3)
1. `启动docker服务`
* sudo service docker start
2. `把Docker服务注册为开机启动`
* sudo chkconfig docker on
3. `检查docker进程是否已经启动`
* ps -ef | grep docker