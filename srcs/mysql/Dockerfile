FROM alpine:latest

#install mariadb
RUN apk add mariadb mariadb-common mariadb-client

#setup status command
RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

COPY create_user.sql /home/

EXPOSE 3306

RUN echo -e "\n[mysqld]\nskip-networking=0\nskip-bind-address\n" >> /etc/my.cnf

#start mariadb and setup
CMD /etc/init.d/mariadb setup ; rc-service mariadb start ; mariadb < /home/create_user.sql ; sleep infinity
