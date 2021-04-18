FROM alpine:latest

EXPOSE 8086

RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

COPY setup_influx /home/

CMD apk add influxdb ; rc-service influxdb start ; sleep 5 ; cat /home/setup_influx | influx ; influxdb ; sleep infinity
