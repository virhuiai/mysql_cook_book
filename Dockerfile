FROM mysql:5.7
COPY ./mcb-kjv /virhuiai/mysql_cook_book/mcb-kjv
COPY ./recipes /virhuiai/mysql_cook_book/recipes
WORKDIR /virhuiai/mysql_cook_book/
## docker build . -t mysql_cook_book_tmp
## docker run -itd --rm --name tmp mysql_cook_book_tmp /bin/bash
## docker exec -it tmp /bin/bash;

# docker run  -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! -itd --name mysql_cook_book virhuiai/mysql_cook_book /bin/sh
# docker run  -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! -itd --rm --name mysql_cook_book_tmp virhuiai/mysql_cook_book /bin/sh

# docker run  -e MYSQL_DATABASE=cookbook -e MYSQL_USER=cbuser -e MYSQL_PASSWORD=cbpass! -e MYSQL_ROOT_PASSWORD=Passw0rd! -itd --rm --name mysql_cook_book_tmp mysql_cook_book_tmp
# docker exec -it mysql_cook_book_tmp /bin/sh;
# mysql -ucbuser -Dcookbook -p

