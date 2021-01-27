

# mysql_cook_book

容器，包含mysql_cook_book的例子



# 镜像名



```
virhuiai/mysql_cook_book
```





# 使用



**运行容器**



```bash
docker run -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! --rm --name mysql_cook_book_tmp -d virhuiai/mysql_cook_book:latest
```



如果要保留容器信息接着学习，可以不要`--rm`参数。



**进入容器**：



```
docker exec -it mysql_cook_book_tmp /bin/sh
```



**连接mysql**



```bash
mysql -ucbuser -Dcookbook -p
接着输入密码
```



此时自动是在`/virhuiai/mysql_cook_book/`目录，有着本书的例子的文件：



```bash
# pwd
/virhuiai/mysql_cook_book
# dir
mcb-kjv  recipes
```





# 镜像Dockerfile



```dockerfile
FROM mysql:5.7
# 下面两个文件是之前看书时下载好的
COPY ./mcb-kjv /virhuiai/mysql_cook_book/mcb-kjv
COPY ./recipes /virhuiai/mysql_cook_book/recipes
WORKDIR /virhuiai/mysql_cook_book/
```





# 将密码放到选项文件中



```bash
echo '' >> /etc/mysql/conf.d/mysql.cnf & \
echo '# 通用客户端程序连接选项 ' >> /etc/mysql/conf.d/mysql.cnf & \
echo '[client]' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'host = localhost' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'user = cbuser' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'password = cbpass!' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'database = cookbook ' >> /etc/mysql/conf.d/mysql.cnf
```



此时，输入mysql,即可以直接连上数据库：



```
# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 5.7.33 MySQL Community Server (GPL)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select database();
+------------+
| database() |
+------------+
| cookbook   |
+------------+
1 row in set (0.00 sec)

mysql> 
```



```
docker run -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! --rm --name mysql_cook_book_tmp -d virhuiai/mysql_cook_book:version-mysql-cnf
```



```
vmysql-cnf
```

