#! /bin/bash
sudo apt-get update
sudo apt -y install software-properties-common
sudo apt-add-repository --yes ppa:ondrej/php
sudo apt-get install -y apache2 php7.4 php7.4-mysql libapache2-mod-php7.4 mysql-server python3-pymysql 
sudo apt-get install -y php7.4-curl php7.4-gd php7.4-mbstring php7.4-xml php7.4-xmlrpc php7.4-soap php7.4-intl php7.4-zip
