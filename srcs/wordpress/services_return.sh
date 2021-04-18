rc-service nginx status
if [ $? -ne 0 ]; then
     exit 1
fi
rc-service php-fpm7 status
if [ $? -ne 0 ]; then
     exit 1
fi
rc-service mariadb status
if [ $? -ne 0 ]; then
     exit 1
else
	exit 0
fi
