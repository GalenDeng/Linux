# mac命令行 (2019.07.02)

1. `打开某个文件`
* open xxx(目录)

* [mac下install nginx](https://www.cnblogs.com/meng1314-shuai/p/8335140.html)

2. 
```
Mac上启动nginx报错:nginx: [emerg] bind() to 0.0.0.0:80 failed (48: Address already in use)
```
```
解决方法:
sudo nginx -s stop(或者:sudo nginx -s quit),然后重新启动(sudo nginx)
```