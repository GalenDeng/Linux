## makefile学习笔记
[makefile学习笔记](http://www.cnblogs.com/sekon/p/6437705.html)
1. `代码`
```
CC      = arm-linux-gcc
LD      = arm-linux-ld
AR      = arm-linux-ar
OBJCOPY = arm-linux-objcopy
OBJDUMP = arm-linux-objdump

INCLUDEDIR 	:= $(shell pwd)/include
CFLAGS 		:= -Wall -O2
CPPFLAGS   	:= -nostdinc -I$(INCLUDEDIR)

export 	CC LD AR OBJCOPY OBJDUMP INCLUDEDIR CFLAGS CPPFLAGS

objs := head.o init.o nand.o interrupt.o serial.o lcddrv.o framebuffer.o lcdlib.o main.o lib/libc.a

lcd.bin: $(objs)
	${LD} -Tlcd.lds -o lcd_elf $^
	${OBJCOPY} -O binary -S lcd_elf $@
	${OBJDUMP} -D -m arm lcd_elf > lcd.dis

.PHONY : lib/libc.a
lib/libc.a:
	cd lib; make; cd ..
	
%.o:%.c
	${CC} $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

%.o:%.S
	${CC} $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

clean:
	make  clean -C lib
	rm -f lcd.bin lcd_elf lcd.dis *.o
```
2. `解释`
```
主Makefile总领全局的就这句——
lcd.bin: $(objs)

要生成lcd.bin，依赖于objs列举的一堆文件：head.o init.o nand.o interrupt.o serial.o lcddrv.o framebuffer.o lcdlib.o main.o lib/libc.a

所以要先找到这些文件，几个.o，还有一个.a

.o目标文件怎么生成？

%.o:%.c和%.o:%.S是生成规则，就是依赖于.c或.S文件，使用交叉编译命令生成。

.a是库文件，到lib子目录里去找，在子目录里用make命令生成

下面逐行解读：

CC = arm-linux-gcc   //编译器。定义CC变量，为了简化书写

LD = arm-linux-ld　　//连接器。定义LD变量，为了简化书写
AR = arm-linux-ar　　//库管理器。将多个可重定位的目标模块归档为一个函数库文件。这个变量在lib/makefile文件中使用了
OBJCOPY = arm-linux-objcopy
OBJDUMP = arm-linux-objdump

INCLUDEDIR := $(shell pwd)/include        //定义头文件目录变量  $(shell pwd)为获取当前工作路径
CFLAGS := -Wall -O2　　//GCC的编译参数  -Wall显示所有编译错误或警告  -O2优化选项，编译时使用2级优化
CPPFLAGS := -nostdinc -I$(INCLUDEDIR) 　　//GCC编译参数  -nostdinc忽略缺省目录  -Idir把dir加到头文件的搜索路径中,而且gcc会在搜索标准头文件之前先搜索dir.  

备注：‘=’与‘:=’的区别：

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

 
export CC LD AR OBJCOPY OBJDUMP INCLUDEDIR CFLAGS CPPFLAGS　　//这些变量将传递到下级Makefile,本文件中指的是生成lib/libc.a库文件时的Makefile

* lib/libc.a库文件时的Makefile
objs := div64.o lib1funcs.o ctype.o muldi3.o printf.o string.o vsprintf.o

libc.a: $(objs)
	${AR} -r -o $@ $^
	
%.o:%.c
	${CC} $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

%.o:%.S
	${CC} $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

clean:
	rm -f libc.a *.o	



objs := head.o init.o nand.o interrupt.o serial.o lcddrv.o framebuffer.o lcdlib.o main.o lib/libc.a  　　//定义变量objs，包含了生成目标文件所需的文件

lcd.bin: $(objs)　　//定义生成目标lcd.bin，依赖于objs对象。执行这条命令时，先生成所有依赖文件，然后依次执行下面三条命令
　　${LD} -Tlcd.lds -o lcd_elf $^　　//执行shell命令，LD变量前面定义”LD = arm-linux-ld“，即进行连接，使用lcd.lds为连接脚本，输出目标为lcd_elf，$^表示全部依赖文件
　　${OBJCOPY} -O binary -S lcd_elf $@　　//执行shell命令，将lcd_elf文件转换成二进制文件，-O表示输出格式，-S表示不从源文件中复制重定位信息和符号信息到目标文件中
　　${OBJDUMP} -D -m arm lcd_elf > lcd.dis　　//反汇编lcd_elf文件为lcd.dis文件

.PHONY : lib/libc.a　　//.PHONY表示伪目标，不要管lib/libc.a文件是否存在
lib/libc.a:　　//当生成依赖文件lib/libc.a文件时，用下面的命令段，即cd lib; make; cd ..
　　cd lib; make; cd ..　　//进入lib目录，然后执行make命令，最后返回到当前目录。在lib子目录执行make命令时将使用子目录的Makefile，但于由前面export命令，本文件定义的一些变量将传递过去
%.o:%.c　　//%通配符。生成xxx.o文件先要找到xxx.c文件
　　${CC} $(CPPFLAGS) $(CFLAGS) -c -o $@ $<　　//-c编译不连接。$@表示目标文件   $<表示第一个依赖文件

%.o:%.S
　　${CC} $(CPPFLAGS) $(CFLAGS) -c -o $@ $<

clean:　　//这个clean目标没有依赖对象，肯定是生成不了clean文件的，但会执行下面的命令。前面写明.PHONY : clean就更清楚了
　　make clean -C lib
　　rm -f lcd.bin lcd_elf lcd.dis *.o
```
