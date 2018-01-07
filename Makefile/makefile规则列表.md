## makefile规则列表 (2018.1.7)
1. `makefile中使用shell命令`
* $(shell command arguments)
```
函数 shell 是 make 与外部环境的通信工具，函数shell的执行结果和在
控制台上执行 "command arguments"的结果相似，但把返回结果的换行符
和回车符变为单个空格，若返回结果最后是换行符/回车符，则被去掉
```
```
当前的目录有 1.c 2.c
c_src := $(shell ls *.c)
结果为 1.c 2.c
```
```
INCLUDEDIR 	:= $(shell pwd)/include
```

2. `-nostdinc 该选项指示不要标准路径下的搜索头文件,而只搜索-I选项指定的路径和当前路径`
```
INCLUDEDIR 	:= $(shell pwd)/include
CFLAGS 		:= -Wall -O2
CPPFLAGS   	:= -nostdinc -I$(INCLUDEDIR)
```
3. ` = 与 := 的区别：`
```
   “=”：make会将整个makefile展开后，再决定变量的值。也就是说，变量的值将会是整个makefile中最后被指定的值。看例子：

            x = foo
            y = $(x) bar
            x = xyz

      在上例中，y的值将会是 xyz bar ，而不是 foo bar 。

      “:=”表示变量的值决定于它在makefile中的位置，而不是整个makefile展开后的最终值。

            x := foo
            y := $(x) bar
            x := xyz

      在上例中，y的值将会是 foo bar ，而不是 xyz bar 了。
```
4. `.PHONY`
```
.PHONY : lib/libc.a　　//.PHONY表示伪目标，不要管lib/libc.a文件是否存在
lib/libc.a:　　//当生成依赖文件lib/libc.a文件时，用下面的命令段，即cd lib; make; cd ..
　　cd lib; make; cd ..　　//进入lib目录，然后执行make命令，最后返回到当前目录。在lib子目录执行make命令时将使用子目录的Makefile，但于由前面export命令，本文件定义的一些变量将传递过去
```