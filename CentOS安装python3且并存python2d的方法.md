# CentOS安装python3且并存python2d的方法 (2020.02.20)

* [参考安装方法](https://www.cnblogs.com/zhlblog/p/9499470.html)
```
* which python 查看一下Python可执行文件的位置
* 可见执行文件在/usr/bin/ 目录下，切换到该目录下执行 ll python* 命令查看
* 
    因为我们要安装python3版本，所以python要指向python3才行，目前还没有安装python3，先备份,备份之前先安装相关包，用于下载编译python3
    yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gcc make
    不能忽略相关包，我之前就没有安装readline-devel导致执行python模式无法使用键盘的上下左右键
* 备份，mv python python.bak
* 去官网下载编译安装包或者直接执行以下命令下载
    wget https://www.python.org/ftp/python/3.6.2/Python-3.6.2.tar.xz
* 解压 tar -xvJf  Python-3.6.2.tar.xz
* cd Python-3.6.2 进入
* 编译安装
    ./configure prefix=/usr/local/python3 // 这里设置了安装在 /usr/local/python3 这里
    make && make install
*  安装完毕，/usr/local/目录下就会有python3了
* ln -s /usr/local/python3/bin/python3 /usr/bin/python 添加软链接
* 测试： python -V  看看输出的是不是python3的版本
* 因为执行yum需要python2版本，所以我们还要修改yum的配置，执行：
    vim /usr/bin/yum,把#! /usr/bin/python修改为#! /usr/bin/python2
    vim /usr/libexec/urlgrabber-ext-down 文件里面的#! /usr/bin/python 也要修改为#! /usr/bin/python2
* python2 -V 版本2 ,即python3和python2并存成功
```

* 根据参考链接方法install python3 之后，执行
```
*  sudo ln -s /usr/local/python3/bin/pip3 /usr/bin/pip // 软链接 pip3 到 /usr/bin/pip
*  sudo pip install --upgrade pip
*  sudo pip install Django==3.0.3
*  pip show django  // 查看django的版本和安装路径

普通用户状态下安装的django，django没有加入到系统全局path里,所以不能直接用
* 添加bin程序到系统环境变量里面
    sudo vim /etc/profile
    // add的path 必须是bin目录下
    export export PATH=$PATH:/usr/local/python3/bin
    // 所有用户可用
    // source /etc/profile  即时生效
```

* [关于环境变量PATH的添加和查看](https://www.cnblogs.com/cucuad/p/10114606.html)

2. `django.core.exceptions.ImproperlyConfigured: SQLite 3.8.3 or later is required (found 3.7.17).`
* [sqlite版本太低解决方法](https://blog.csdn.net/weixin_43336281/article/details/100055435)