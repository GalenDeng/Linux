# django-mysql-operation (2020.03.02)

* `search my.cnf 配置文件的路径`
* mysql --verbose --help | grep my.cnf
  order of preference, my.cnf, $MYSQL_TCP_PORT,
/etc/my.cnf /etc/mysql/my.cnf /usr/local/etc/my.cnf ~/.my.cnf 

* `check whether mysql has started or not`
```
ps -ef | grep mysqld
```

1. `进入mysql`
* mysql -uroot -p

2. `search databases`
* show databases;

3. `create a database`
* create database djangotest charset utf8; // create a database that is named as djangotest

4. `delete a database`
* drop database djangotest;

5. `报错解决`
```
1）
File "manage.py", line 14
) from exc
^
SyntaxError: invalid syntax

* 解决方法： 把 python2 switch to python3

2）
django.core.exceptions.ImproperlyConfigured: Error loading MySQLdb module.
Did you install mysqlclient?

* 解决方法: 
* pip install pymysql;
* 在项目下的__init__.py 加上：
  import pymysql
  pymysql.install_as_MySQLdb()

cd /home/galen/django_practice/venv/lib/python3.8/site-packages/django/db/backends/mysql
vim base.py
注释以下代码：
#if version < (1, 3, 13):
#    raise ImproperlyConfigured('mysqlclient 1.3.13 or newer is required; you have %s.' % Database.__version__) 

vim operations.py
#找到operations.py文件(46行),将decode改为encode
#linux vim 查找快捷键：？decode
if query is not None:
    query = query.decode(errors='replace')
return query
#改为
if query is not None:
    query = query.encode(errors='replace')
return query

```

6. `django 添加 mysql 配置`
```
* add the config for installing the polls app
INSTALLED_APPS = [
    'polls.apps.PollsConfig',
]    

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'djangotest', #数据库名
	'USER': 'root',
	'PASSWORD': 'Galen0814',
	'HOST': '127.0.0.1',  # 不要config to the 公网IP
	'PORT': '3306', #端口
    }
}
```

7. `search the migrations the content that is returned to some SQL opration`
```
# It’s useful for checking what Django is going to do or if you have database administrators who require SQL scripts for changes
* python manage.py sqlmigrate polls 0001
--
-- Create model Question
--
CREATE TABLE `polls_question` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `question_text` varchar(200) NOT NULL, `pub_date` datetime(6) NOT NULL);
--
-- Create model Choice
--
CREATE TABLE `polls_choice` (`id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY, `choice_text` varchar(200) NOT NULL, `votes` integer NOT NULL, `question_id` integer NOT NULL);
ALTER TABLE `polls_choice` ADD CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`);


#you can also run python manage.py check; this checks for any problems in your project without making migrations or touching the database
```
8. `真正生成各需要的表格到database`
```
* python manage.py migrate // create those model tables in your database
```

9. `remember the three-step guide to making model changes:`
```
    Change your models (in models.py).
    Run python manage.py makemigrations to create migrations for those changes
    Run python manage.py migrate to apply those changes to the database.

```
10. `invoke the python shell`
* python manage.py shell

11. `create superuser`
* python manage.py createsuperuser
