# mysql_cook_book
容器，包含mysql_cook_book的例子



# 镜像名



```
virhuiai/mysql_cook_book
```





# 使用



**运行容器**



```bash
docker run \
-e MYSQL_DATABASE=cookbook \
-e MYSQL_USER=cbuser \
-e MYSQL_PASSWORD=cbpass!  \
-e MYSQL_ROOT_PASSWORD=Passw0rd! 
--rm \
--name mysql_cook_book_tmp \
mysql_cook_book_tmp
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





