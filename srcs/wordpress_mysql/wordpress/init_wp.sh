wp core install --url=172.17.0.2:5050 --title=mywebsite --admin_user=leboss --admin_password=password --admin_email=test@gmail.com --skip-email --path=/home/www/wordpress
wp user create clement clement@gmail.com --role=editor --path=/home/www/wordpress
wp user create david david@gmail.com --role=author --path=/home/www/wordpress
wp user create marion marion@gmail.com --role=contributor --path=/home/www/wordpress
wp user create joan joan@gmail.com --role=subscriber --path=/home/www/wordpress
