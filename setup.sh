#initialize minikube
kubectl delete deployments --all; kubectl delete services --all; kubectl delete pods --all
minikube stop
minikube delete
minikube start --driver=docker
eval $(minikube docker-env)

#install Metallb Load Balancer
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f ./srcs/load_balancer/metallb.yaml

#setup mysql 
docker build -t mysql ./srcs/mysql/
kubectl apply -f ./srcs/mysql/mysql.yaml

#setup influxDB
docker build -t influxdb ./srcs/influxdb/
kubectl apply -f ./srcs/influxdb/influxdb.yaml

#setup nginx
docker build -t nginx ./srcs/nginx/
kubectl apply -f ./srcs/nginx/nginx.yaml

#setup ftps
docker build -t ftps ./srcs/ftps/
kubectl apply -f ./srcs/ftps/ftps.yaml

#setup wordpress
docker build -t wordpress ./srcs/wordpress/
kubectl apply -f ./srcs/wordpress/wordpress.yaml

#setup phpmyadmin

docker build -t phpmyadmin ./srcs/phpmyadmin/
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

#setup grafana

docker build -t grafana ./srcs/grafana/
kubectl apply -f ./srcs/grafana/grafana.yaml
