## vmware下安装windows7的方法 (2018.07.16)
1. `安装需要的软件包`
* [ghost win7 64位的系统镜像文件](http://win7.ppsrc.cn/index.html?para=2)
* VMware

2. `安装教程`
* [虚拟机安装64位原版win7教程](https://jingyan.baidu.com/article/da1091fb352983027949d64b.html)
* [老毛桃](http://laomaotao.ecnub.pw/upzwin7.html)

3. `VMware安装的windows7系统和本地的windows7互传文件方式`
* VMware的菜单栏 click 虚拟机 -> VMware Tools安装
* 安装完后，我们要进入到vmware下安装的win7系统，进行 setup64安装，一般打开计算机磁盘即可看到

4. `VMware安装的windows7系统的上网设置方式`
* ![本地连接属性共享设置](https://github.com/GalenDeng/linux/blob/master/vmware下安装win7及配置/本地连接属性共享设置.PNG)
* 在vmware的菜单栏 click 虚拟机 -> 设置 -> 网络适配器 -> 选NAT模式
* 在vmware安装的win7下设置局域网代理上网(IE上网)
* 此时即可上网
* [上网设置参考](https://jingyan.baidu.com/article/48b37f8d68b4ef1a646488f1.html)