## CentOS设置IPV4的方法 (2017.10.3)
1. 以`root的权限`, `cd /etc/sysconfig/network-scripts`
2. `vim ifcfg-eth0`
3. `修改为以下的形式`
```
DEVICE=eth0                                             #网卡地址代号
BOOTPROTO=dhcp                                          #DHCP自动获取
HWADDR=00:16:3E:BC:82:0F                                #网卡MAC地址
ONBOOT=yes                                              #开机自动启动
```
4. `重启network服务使其生效`
```
service network restart
ifconfig
```