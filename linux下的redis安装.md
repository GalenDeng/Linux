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

