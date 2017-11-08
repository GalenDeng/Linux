## id命令查找uid范围内的用户文件 （2017.11.08）
```
在linux命令中 + 表示大于， - 表示小于
```

1. `查找uid > 1000 的用户文件`
* $ find . -type f -uid +1000

2.   id <user>  
```
查出user对应到的uid
```
3. id <uid>
```
查到用户名
```

3. `找到所有者不是root的所有文件`
* find / -type f -uid +0

4. `找到所有者不是uid为1000的所有文件`
* find / -type f -uid +1000; find / -type f -uid -1000