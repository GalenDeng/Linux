# 腾讯云-python_web_Django搭建步骤 (2020.02.23)

1. yum install python-setuptools -y
2. wget https://www.djangoproject.com/m/releases/1.11/Django-1.11.3.tar.gz
3. tar -zxvf Django-1.11.3.tar.gz
4. cd Django-1.11.3
   python setup.py install
5. python /usr/lib/python2.7/site-packages/Django-1.11.3-py2.7.egg/django/bin/django-admin.py startproject HelloWorld
6. cd HelloWorld
7. 
```
内网启动:
* python manage.py runserver
外网启动：
* 首先我们将程序跑在80端口
* 我们访问:http://119.29.184.25/
```
8. `修改配置文件`
```
我们发现提示因为安全问题不能访问，接下来我们修改配置
cd HelloWorld  
nano settings.py

在settings.py里
我们把:
ALLOWED_HOSTS = []
改成
ALLOWED_HOSTS = ['*']
重新启动

cd ../
python manage.py runserver 0.0.0.0:80   // root用户使用该command
python manage.py runserver 0.0.0.0:8000 // 一般的sudoers用户使用该command
```
