#!/bin/bash

sudo yum install -y wget
wget https://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
sudo yum install -y mysql57-community-release-el7-8.noarch.rpm
sudo yum -y install mysql-server
sudo systemctl start mysqld
sudo systemctl enable mysqld
MYSQL_TEMP_PWD=`sudo cat /var/log/mysqld.log | grep 'A temporary password is generated' | awk -F'root@localhost: ' '{print $2}'`
mysqladmin -u root -p`echo $MYSQL_TEMP_PWD` password 'Passw0rd!'
cat << EOF > .my.cnf
[client]
user=root
password=Passw0rd!
EOF