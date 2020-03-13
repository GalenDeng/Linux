linux install python (2020.02.20)

* `install`
```
# tar -zxvf Python-3.6.1.tgz
# cd Python-3.6.1
# ./configure
# make && make install


1. 如果instaall 过程中报：
zipimport.ZipImportError: can't decompress data; zlib not available
make: *** [install] Error 1

这是缺少zlib依赖包，执行：
* yum install zlib* -y
* 然后再进行 ./configure , make , make install 等操作

2. 如果报 Can't connect to HTTPS URL because the SSL module is not available. - skipping

* 这是因为pip3会用到ssl模块，之前没有指定所以该功能不能使用，要执行
* ./configure --prefix=/usr/local/python3.6.3 --with-ssl
* 然后再 make && make install


3. 报了"ModuleNotFoundError: No module named '_ctypes'"的错误
* yum install libffi-devel -y
* repeat  make&make install


```