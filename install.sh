#!/bin/bash

# Install Apache
# added 'ServerName 127.0.0.1' to the bottom of /etc/apache2/apache2.conf
sudo apt-get update
sudo apt-get install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Install PHP
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
sudo apt-get install php7.2 php7.2-cli php7.2-common -y
sudo apt-get install php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-intl php7.2-mysql php7.2-xml php7.2-zip -y

# Enable PHP7.2 on Apache2
sudo a2enmod php7.2
sudo systemctl restart apache2

# Install MySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password sathira321'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password sathira321'
sudo apt-get install mysql-server -y