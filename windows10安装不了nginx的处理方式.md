## windows10安装不了nginx的处理方式  (2017.10.19)
1. 打开windows10的cmd界面
2. cd PATH 进入nginx的安装文件里面
* D:\openresty-1.11.2.2>
3. 执行以下的操作
* D:\openresty-1.11.2.2>nginx
```
D:\openresty-1.11.2.2>nginx
nginx: [alert] lua_code_cache is off; this will hurt performance in ./conf/nginx.conf:77
nginx: [alert] lua_code_cache is off; this will hurt performance in ./conf/nginx.conf:177
nginx: [emerg] bind() to 0.0.0.0:443 failed (10013: An attempt was made to access a socket in a way forbidden by its access permissions)

D:\openresty-1.11.2.2>
```
4. 通过`观察以上的报错信息`,`修改nginx.conf配置文件`
* 路径： ./conf/nginx.conf:77   //77行报错
* 修改配置如下：
lua_code_cache is on
* nginx: [emerg] bind() to 0.0.0.0:443 failed (10013: An attempt was made to access a socket in a way forbidden by its access permissions) 
* 这个报错是因为其他进程占用了nginx 的端口

* [解决问题主页](http://blog.csdn.net/hukang00/article/details/41518659)
```
解决方式：
1）netstat -aon|findstr "443"
2）找到 0.0.0.0:443，找到 PID，在任务管理器结束进程。 vmware-hostd.exe
3）重新启动nginx.exe
4) 在浏览器输入localhost，即看到nginx的welcome主页或者你指定的显示主页
```

