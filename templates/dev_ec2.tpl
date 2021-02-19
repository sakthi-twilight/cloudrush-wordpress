#! /bin/bash
sudo apt-get update
sudo apt -y install software-properties-common
sudo apt-add-repository --yes ppa:ondrej/php
sudo apt-add-repository --yes --update ppa:ansible/ansible 
sudo apt-get install -y apache2 php7.4 php7.4-mysql libapache2-mod-php7.4 mysql-server python3-pymysql ansible 
sudo apt-get install -y php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml php7.4-xmlrpc php7.4-soap php7.4-intl php7.4-zip

#Wordpress Configurations
sudo wget -c https://wordpress.org/latest.tar.gz -O - | sudo tar -xz -C /var/www/html/
sudo rm /var/www/html/index.html
sudo mv /var/www/html/wordpress/* /var/www/html/
sudo chown www-data:www-data -R /var/www/html/
sudo find /var/www/html/ -type d -exec chmod 755 {} \;
sudo find /var/www/html/ -type f -exec chmod 644 {} \;

#MySQL Configurations
sudo mysql -e "SET PASSWORD FOR root@localhost = PASSWORD('${dev_mysql_root_password}');FLUSH PRIVILEGES;"
sudo mysql -e "DELETE FROM mysql.user WHERE User='';"
sudo mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
sudo mysql -e "CREATE DATABASE IF NOT EXISTS ${dev_wordpress_db_name}"
sudo mysql --user=root --password='${dev_mysql_root_password}' -e "CREATE USER '${dev_wordpress_username}'@'localhost' IDENTIFIED BY '${dev_wordpress_password}';GRANT ALL PRIVILEGES ON *.* TO '${dev_wordpress_username}'@'localhost';FLUSH PRIVILEGES;"

#Restart Services
sudo systemctl restart mysql
sudo systemctl restart apache2