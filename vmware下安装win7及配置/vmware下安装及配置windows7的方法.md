## vmware下安装及配置windows7的方法 (2018.07.17)
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

5. `安装software的时候出现缺失 mfc100u.dll / mscvr100.dll的解决方式`
* [参考文档](https://jingyan.baidu.com/article/f79b7cb3412c549144023e15.html)
```
* 网上下载相应版本的 X86 / X64 版本的  mfc100u.dll / mscvr100.dll
* cmd
* regsvr32 mfc100u.dll / regsvr32 mscvr100.dll
* restart windows
```

6. `应用程序无法正常启动0xc000007b`
1) 导致此情况的原因
```
1、电脑没有安装DirectX9或者DirectX 9.0 组件损坏；
2、电脑没有安装Microsoft Visual C++；
3、电脑上没有安装.net。
```
2) 解决方法
```
使用DirectX修复工具(百度下载),修复完成之后，重启一般可以解决这个问题
```
* [DirectX](http://www.xitongzhijia.net/soft/24834.html)

* [Win7专业版SP1 64位可以激活的密钥](https://wenda.so.com/q/1456159576726349?src=150)

* [BarTender](http://xiazai.bartender.cc/trail/Bartender_Trial_x64.exe )