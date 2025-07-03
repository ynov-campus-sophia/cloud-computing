#!/bin/bash
apt update && apt install -y apache2 php php-mysql wget unzip

cd /var/www/html
rm -f index.html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
chown -R www-data:www-data /var/www/html

cp wp-config-sample.php wp-config.php
sed -i 's/database_name_here/wordpress/' wp-config.php
sed -i 's/username_here/wpuser/' wp-config.php
sed -i 's/password_here/wppassword/' wp-config.php
sed -i 's/localhost/10.1.1.2/' wp-config.php

systemctl restart apache2
