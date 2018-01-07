## makefile规则列表 (2018.1.7)
1. `makefile中使用shell命令`
* $(shell command arguments)
```
函数 shell 是 make 与外部环境的通信工具，函数shell的执行结果和在
控制台上执行 "command arguments"的结果相似，但把返回结果的换行符
和回车符变为单个空格，若返回结果最后是换行符/回车符，则被去掉
```
当前的目录有 1.c 2.c
c_src := $(shell ls *.c)
结果为 1.c 2.c
```
```
INCLUDEDIR 	:= $(shell pwd)/include
```