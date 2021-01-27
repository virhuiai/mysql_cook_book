FROM mysql:5.7
COPY ./mcb-kjv /virhuiai/mysql_cook_book/mcb-kjv
COPY ./recipes /virhuiai/mysql_cook_book/recipes
# 加速下载，http版本
RUN echo '# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释' > /etc/apt/sources.list && \
echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src http://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free' >> /etc/apt/sources.list && \
echo 'deb http://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /etc/apt/sources.list && \
echo '# deb-src http://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free' >> /etc/apt/sources.list && \
# 安装 常用的 vim mlocate unzip wget
set -eux; \
	apt-get update && \
	apt-get install -y --no-install-recommends \
        vim \
        mlocate \
        unzip \
        tree \
        wget && \
	rm -rf /var/lib/apt/lists/* && \
  apt-get clean && \
# 配置，保存密码
echo '' >> /etc/mysql/conf.d/mysql.cnf & \
echo '# 通用客户端程序连接选项 ' >> /etc/mysql/conf.d/mysql.cnf & \
echo '[client]' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'host = localhost' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'user = cbuser' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'password = cbpass!' >> /etc/mysql/conf.d/mysql.cnf & \
echo 'database = cookbook ' >> /etc/mysql/conf.d/mysql.cnf
# select database();
# mysql --print-defaults  ，可以发现密码在这没有明文显示出来
# my_print_defaults client mysql
WORKDIR /virhuiai/mysql_cook_book/

## docker build . -t mysql_cook_book_tmp
## docker run -itd --rm --name tmp mysql_cook_book_tmp /bin/bash
## docker exec -it tmp /bin/bash;

# docker run  -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! -itd --name mysql_cook_book virhuiai/mysql_cook_book /bin/sh
# docker run  -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! -itd --rm --name mysql_cook_book_tmp virhuiai/mysql_cook_book /bin/sh

# docker run --rm  -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! -itd --rm --name mysql_cook_book_tmp virhuiai/mysql_cook_book:latest
# docker exec -it mysql_cook_book_tmp /bin/sh;
# mysql -ucbuser -Dcookbook -p

