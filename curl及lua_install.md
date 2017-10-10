## curl的简介及使用 (2017.10.10)

1. `curl命令`
```
curl命令是一个利用URL规则在命令行下工作的文件传输工具。它支持文件的上传和下载，所以是综合传输工具，但按传统，习惯称curl为下载工具。作为一款强力工具，curl支持包括HTTP、HTTPS、ftp等众多协议，还支持POST、cookies、认证、从指定偏移处下载部分文件、用户代理字符串、限速、文件大小、进度条等特征。做网页处理流程和数据检索自动化，curl可以祝一臂之力
```
2. `下载`
```
1)curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
2) -O：使用URL中默认的文件名保存文件到本地
   -R:	在本地生成文件时，保留远程文件时间
```
3. `linux下安装Lua`
```
curl -R -O http://www.lua.org/ftp/lua-5.3.0.tar.gz
tar zxf lua-5.3.0.tar.gz
cd lua-5.3.0
make linux test
make install
```