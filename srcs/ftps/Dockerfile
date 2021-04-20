FROM alpine:latest

EXPOSE 20 21 21004-21010 

RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

RUN apk add vsftpd ; rc-update add vsftpd default

RUN adduser -D mlebrun ; echo "mlebrun:password"  | chpasswd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN apk add openssl ; openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=France/L=Paris/O=42/OU=42/CN=ft_services" -keyout /etc/ssl/private/ssl.key -out /etc/ssl/private/ssl.crt

COPY start_vsftpd.sh /home/

CMD /home/start_vsftpd.sh
