FROM alpine:latest

RUN apk add telegraf

COPY telegraf.conf /etc/telegraf.conf

CMD telegraf --config /etc/telegraf.conf
