## linux下的redis安装 (2017.10.18)
1.
* cd /usr/local/src 
* sudo wget http://download.redis.io/releases/redis-4.0.2.tar.gz
* sudo tar zxvf redis-4.0.2.tar.gz
* cd redis-4.0.2
* make
2. 
//PREFIX=''  表示要安装的路径位置
* sudo make PREFIX=/usr/local/redis install  
```
galen@galen-virtual:/usr/local$ ls
bin  etc  games  include  lib  man  redis  sbin  share  src
```
3. `redis的可执行文件`
```
galen@galen-virtual:/usr/local/redis/bin$ ls
redis-benchmark  redis-check-aof  redis-check-rdb  redis-cli  redis-sentinel  redis-server
```
4. `redis的启动需要一个配置文件,可以修改端口号`
* sudo cp -a redis.conf /usr/local/redis/
```
galen@galen-virtual:/usr/local/redis$ ls -lt
total 64
drwxr-xr-x 2 root root  4096 10月 18 09:57 bin
-rw-rw-r-- 1 root root 57764 9月  21 22:12 redis.conf
```
5. `前台启动`
* $ ./redis-server //这样会妨碍我们的其他操作
* ctrl+c打断程序或者ctrl+z停止程序
* `杀死程序`
```
galen@galen-virtual:/usr/local/redis/bin$ ps
  PID TTY          TIME CMD
 5870 pts/2    00:00:00 bash
 6174 pts/2    00:00:20 redis-server
 6761 pts/2    00:00:00 ps
galen@galen-virtual:/usr/local/redis/bin$ kill -9 6174
[1]+  Killed                  ./redis-server
```
6. `修改配置文件`
* galen@galen-virtual:/usr/local/redis$ sudo vim redis.conf
* 把配置文件的daemonize no 改为 daemonize yes
7. `后台运行`
* 运行./bin/redis-server服务的时候使用 ./redis.conf里面的配置
```
galen@galen-virtual:/usr/local/redis$ sudo ./bin/redis-server ./redis.conf 
6826:C 18 Oct 13:22:51.006 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
6826:C 18 Oct 13:22:51.007 # Redis version=4.0.2, bits=64, commit=00000000, modified=0, pid=6826, just started
6826:C 18 Oct 13:22:51.007 # Configuration loaded
```
8. `查看redis是否已经启动服务了`
```
galen@galen-virtual:/usr/local/redis$ ps -ef | grep -i redis
galen     6827     1  0 13:22 ?        00:00:00 ./bin/redis-server 127.0.0.1:6379
galen     6838  5870  0 13:25 pts/2    00:00:00 grep --color=auto -i redis
```
9. `关闭redis`
* kill -9 6827  //不建议使用这种方式
OR
* sudo ./bin/redis-cli shutdown
```
galen@galen-virtual:/usr/local/redis$ sudo ./bin/redis-cli shutdown
galen@galen-virtual:/usr/local/redis$ ps -ef | grep -i redis
galen     7021  5870  0 13:44 pts/2    00:00:00 grep --color=auto -i redis
galen@galen-virtual:/usr/local/redis$
```
10. `进入redis`
*  sudo ./bin/redis-server ./redis.conf
*  ./bin/redis-cli
```
galen@galen-virtual:/usr/local/redis$ sudo ./bin/redis-server ./redis.conf 
7025:C 18 Oct 13:45:46.847 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
7025:C 18 Oct 13:45:46.848 # Redis version=4.0.2, bits=64, commit=00000000, modified=0, pid=7025, just started
7025:C 18 Oct 13:45:46.848 # Configuration loaded
galen@galen-virtual:/usr/local/redis$ ./bin/redis-cli 
127.0.0.1:6379> 
```
11. `表示连接redis没问题的测试`
```
127.0.0.1:6379> ping
PONG
```
12. 
```
127.0.0.1:6379> set name 1  //name为key 1为value
OK
127.0.0.1:6379> get name    //获取key--name的value
"1"
127.0.0.1:6379> del name    //删除操作
(integer) 1
127.0.0.1:6379> keys *      //查看当前数据库中的所有的key
1) "name"
```