#!/bin/bash
apt update && apt install -y mysql-server
sed -i 's/bind-address.*/bind-address = 10.1.1.2/' /etc/mysql/mysql.conf.d/mysqld.cnf
systemctl restart mysql

mysql -e "CREATE DATABASE wordpress;"
mysql -e "CREATE USER 'wpuser'@'10.1.1.1' IDENTIFIED BY 'wppassword';"
mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'10.1.1.1';"
mysql -e "FLUSH PRIVILEGES;"
