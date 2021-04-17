FROM alpine:latest

EXPOSE 80
EXPOSE 443

RUN apk add nginx ; adduser -g 'Nginx www user' -h /home/www/ wwwmlebrun -D

RUN apk add openssl ; mkdir /etc/nginx/ssl ; chmod 700 /etc/nginx/ssl ; openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/ssl.key -out /etc/nginx/ssl/ssl.crt -subj "/C=FR/ST=France/L=Paris/O=42/OU=42/CN=ft_services"

RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

COPY localhost.conf /etc/nginx/conf.d/localhost.conf

COPY index.html /home/www 

RUN mkdir -p /run/nginx

RUN rm /etc/nginx/conf.d/default.conf

CMD rc-service nginx start ; sleep infinity
