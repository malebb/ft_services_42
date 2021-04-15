FROM alpine:latest

EXPOSE 8086

RUN apk add influxdb

RUN apk add telegraf

RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

COPY setup_influx /home/

COPY telegraf.conf /etc/telegraf.conf

CMD rc-service influxdb start ; rc-service telegraf start ; sleep 5 ; cat /home/setup_influx | influx ; sleep infinity
