# gcc 的 -l 和 -L 参数的意义 （2019.06.21）
* [-l和-L参数的意义](https://blog.csdn.net/xuduorui/article/details/78111705)

1. `-l`
```
* l参数就是用来指定程序要链接的库，-l参数紧接着就是库名
* 数学库，他的库名是m，他的库文件名是libm.so，很容易看出，把库文件名的头lib和尾.so去掉就是库名
* 要用到一个第三方提供的库名字libtest.so，那么我们只要把libtest.so拷贝到/usr/lib里，编译时加上-ltest参数，我们就能用上libtest.so库了（当然要用libtest.so库里的函数，我们还需要与libtest.so配套的头文件）
* 放在/lib和/usr/lib和/usr/local/lib里的库直接用-l参数就能链接了
* 但如果库文件没放在这三个目录里，而是放在其他目录里，这时我们只用-l参数的话，链接还是会出错，出错信息大概是：“/usr/bin/ld: cannot find -lxxx”，也就是链接程序ld在那3个目录里找不到libxxx.so
```
2. `-L`
```
* X11的库，其在/usr/X11R6/lib目录下，编译时要用 -L/usr/X11R6/lib -lX11参数，   -L参数跟着的是库文件所在的目录名
* 如把libtest.so放在/aaa/bbb/ccc目录下，那链接参数就是-L/aaa/bbb/ccc -ltest
```