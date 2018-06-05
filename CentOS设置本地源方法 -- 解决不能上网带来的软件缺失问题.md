## CentOS设置本地源方法 -- 解决不能上网带来的软件缺失问题 (2018.06.05)

1. `不能上网的centos系统,设置本地源`
* [设置本地源参考文章](https://m.jb51.net/article/108594.htm)
* 把安装该centos的镜像文件，如 CentOS-6.8-x86_64-bin-DVD1.iso 复制进 centos的任意目录，做挂载源
  文件[如果vmware install了 vmwaretools,则windows的文件可以直接拖到centos的任意文件目录中]
* 刚安装的centos的普通用户是不能使用sudo命令的，因为它不是sudoers用户,需进行以下操作
```
* su -      // 进入root用户
* 输入密码
* vi /etc/sudoers , 添加
## Allow root to run any commands anywhere
root    ALL=(ALL)       ALL
galen   ALL=(ALL)       ALL                      // 把galen用户添加到sudoers中
```
* `创建本地源挂载点`
```
[galen@localhost ~]$ ls
CentOS-6.8-x86_64-bin-DVD1.iso                   // 镜像文件
Desktop                         Downloads  Pictures  Templates

[root@localhost ~]# sudo mkdir -p /mnt/cdrom    // 创建本地源的挂载点(挂载目录)

[root@localhost yum.repos.d]# mount -o loop /home/galen/CentOS-6.8-x86_64-bin-DVD1.iso /mnt/cdrom/                                      // 挂载镜像文件到 /mnt/cdrom
```
* `备份/etc/yum.repos.d/ or 可删除 rm -rf * /etc/yum.repos.d/ `
```
[root@localhost cdrom]# cd /etc/yum.repos.d/
[root@localhost yum.repos.d]# ls
CentOS-Base.repo  CentOS-Debuginfo.repo  CentOS-fasttrack.repo  CentOS-Media.repo  CentOS-Vault.repo
[root@localhost yum.repos.d]# ls -lt
total 24
-rw-r--r--. 1 root root 1991 May 18  2016 CentOS-Base.repo
-rw-r--r--. 1 root root  647 May 18  2016 CentOS-Debuginfo.repo
-rw-r--r--. 1 root root  289 May 18  2016 CentOS-fasttrack.repo
-rw-r--r--. 1 root root  630 May 18  2016 CentOS-Media.repo
-rw-r--r--. 1 root root 6259 May 18  2016 CentOS-Vault.repo
[root@localhost yum.repos.d]# mkdir backup
[root@localhost yum.repos.d]# mv C* backup/
[root@localhost yum.repos.d]# ls 
backup
[root@localhost yum.repos.d]#
```
* `建立本地源文件，修改yum源配置`
```
* [root@localhost yum.repos.d]# cat backup/CentOS-Media.repo    // 查看本CentOS安装的版本
  gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

* [root@localhost yum.repos.d]# touch local.repo
* [root@localhost yum.repos.d]# vi local.repo 
输入内容如下
[local_server]
name=This is a local repo
baseurl=file:///mnt/cdrom
enabled=1
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
* :wq!保存退出
```
* `更新yum配置`
```
* yum clean all
* yum makecache

如下:
[root@localhost cdrom]# yum clean all
Loaded plugins: fastestmirror, refresh-packagekit, security
Cleaning repos: local_server
Cleaning up Everything
Cleaning up list of fastest mirrors
[root@localhost cdrom]# yum makecache
Loaded plugins: fastestmirror, refresh-packagekit, security
Determining fastest mirrors
local_server                                                                                                                          | 4.0 kB     00:00 ... 
local_server/group_gz                                                                                                                 | 226 kB     00:00 ... 
local_server/filelists_db                                                                                                             | 6.3 MB     00:00 ... 
local_server/primary_db                                                                                                               | 4.7 MB     00:00 ... 
local_server/other_db                                                                                                                 | 2.8 MB     00:00 ... 
Metadata Cache Created
[root@localhost cdrom]#
```
* 现在可以使用 yum -y install xxx 安装软件了
