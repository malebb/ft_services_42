FROM alpine:latest

EXPOSE 3000

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.3.linux-amd64.tar.gz ; tar -zxvf grafana-enterprise-7.5.3.linux-amd64.tar.gz ; apk add libc6-compat ; mv grafana-7.5.3 grafana

COPY default.yaml /grafana/conf/provisioning/datasources/

COPY dashboard_provider.yaml /grafana/conf/provisioning/dashboards/

COPY grafana.json /grafana/conf/provisioning/dashboards/

RUN apk add influxdb

RUN apk add telegraf

RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

COPY setup_influx /home/

COPY telegraf.conf /etc/telegraf.conf

CMD rc-service influxdb start ; rc-service telegraf start ; cd /grafana/ ; ./bin/grafana-server
