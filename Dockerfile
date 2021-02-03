FROM mysql:5.7
COPY ./mcb-kjv /virhuiai/mysql_cook_book/mcb-kjv
COPY ./recipes /virhuiai/mysql_cook_book/recipes
# 加速下载，http版本
COPY ./sources.list /etc/apt/sources.list
# 安装 常用的 vim mlocate unzip wget
RUN set -eux; \
	apt-get update && \
	apt-get install -y --no-install-recommends \
        vim \
        mlocate \
        unzip \
        tree \
        wget && \
	rm -rf /var/lib/apt/lists/* && \
  apt-get clean && cp /etc/mysql/conf.d/mysql.cnf /etc/mysql/conf.d/mysql.cnf.bak
# 配置，保存密码
COPY ./mysql.cnf /etc/mysql/conf.d/mysql.cnf
# select database();
# mysql --print-defaults  ，可以发现密码在这没有明文显示出来
# my_print_defaults client mysql
WORKDIR /virhuiai/mysql_cook_book/

## docker build . -t virhuiai/mysql_cook_book_v2
# docker run \
# -e MYSQL_DATABASE=cookbook \
# -e MYSQL_USER=cbuser \
# -e MYSQL_PASSWORD=cbpass!  \
# -e MYSQL_ROOT_PASSWORD=Passw0rd! \
# --rm --name mysql_cook_book_tmp \
# -it \
# virhuiai/mysql_cook_book_v2 \
# mysql

