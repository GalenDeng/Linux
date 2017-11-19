 ## find和grep命令 (2017.11.19)
 1. `查找名为a.c的文件` : find -name "a.c"
 2. `在当前的目录下搜含有abc字样的文件`
 ```
* grep "abc" -nR
//-n ：会列出搜到的abc在哪一行
*   -n, --line-number         print line number with output lines

//-R : 会搜索本目录及其子目录下的文件
 ``` 