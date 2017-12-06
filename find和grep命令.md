 ## find和grep命令 (2017.11.19)
 1. `查找名为a.c的文件` : find -name "a.c"
 2. `在当前的目录下搜含有abc字样的文件`
 ```
* grep "abc" -nR
//-n ：会列出搜到的abc在哪一行
*   -n, --line-number         print line number with output lines

//-R : 会搜索本目录及其子目录下的文件
 ``` 
 3. `内核目录下查找包含"request_irq"字样的文件`
 * `cd /work/system/linux-2.6.22.6/`
 * `grep "request_irq" * -R`          // * ：查找当前目录下的所有文件、目录 ;  -R : 表示递归查找子目录
 4. `内核的kernel目录下查找包含"request_irq"字样的文件` 
 *  `cd /work/system/linux-2.6.22.6/`
 * `grep "request_irq" kernel -R`     // kernel : 表示在当前目录的kernel子目录下查找 ; -R : 表示递归查找子目录 
 5. `内核目录下查找文件名中包含"fb"字样的文件`
 *  `cd /work/system/linux-2.6.22.6/`
 * `find -name "*fb*"`
 6. `内核的 drivers/net 目录下查找文件名中包含"fb"字样的文件`
 *  `cd /work/system/linux-2.6.22.6/`
 * `find drivers/net -name "*fb*"`    // "drivers/net"必须是find命令的第一个参数

