FROM alpine:latest

EXPOSE 3000

RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.3.linux-amd64.tar.gz ; tar -zxvf grafana-enterprise-7.5.3.linux-amd64.tar.gz ; apk add libc6-compat ; mv grafana-7.5.3 grafana

COPY default.yaml /grafana/conf/provisioning/datasources/

COPY dashboard_provider.yaml /grafana/conf/provisioning/dashboards/

COPY dashboards/nginx.json /grafana/conf/provisioning/dashboards/
COPY dashboards/mysql.json /grafana/conf/provisioning/dashboards/
COPY dashboards/ftps.json /grafana/conf/provisioning/dashboards/
COPY dashboards/influxdb.json /grafana/conf/provisioning/dashboards/
COPY dashboards/grafana.json /grafana/conf/provisioning/dashboards/
COPY dashboards/phpmyadmin.json /grafana/conf/provisioning/dashboards/
COPY dashboards/wordpress.json /grafana/conf/provisioning/dashboards/
COPY dashboards/telegraf.json /grafana/conf/provisioning/dashboards/

RUN apk add openrc ; openrc ; touch /run/openrc/softlevel

CMD cd /grafana/ ; ./bin/grafana-server
