FROM alpine:latest

EXPOSE 3306

RUN apk add mariadb mariadb-common mariadb-client

RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

COPY create_user.sql /home/

RUN echo -e "\n[mysqld]\nskip-networking=0\nskip-bind-address\n" >> /etc/my.cnf

CMD /etc/init.d/mariadb setup ; rc-service mariadb start ; mariadb < /home/create_user.sql ; sleep infinity
