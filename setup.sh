#!/bin/bash
# setup.sh - ICT171 Assignment 2 (Krushang Sakhareliya - 34976955)

# Update and install packages
sudo apt update
sudo apt install apache2 php libapache2-mod-php php-mysql mysql-server -y

# Set up MySQL database and user
sudo mysql <<EOF
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Testpass@123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
EOF

# Download and extract WordPress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
sudo mv wordpress /var/www/html/

# Apache virtual host configuration
sudo bash -c 'cat > /etc/apache2/sites-available/wordpress.conf <<EOL
<VirtualHost *:80>
    ServerAdmin admin@thereciperoom.site
    ServerName thereciperoom.site
    ServerAlias www.thereciperoom.site
    DocumentRoot /var/www/html/wordpress

    <Directory /var/www/html/wordpress/>
        AllowOverride All
    </Directory>

    ErrorLog \${APACHE_LOG_DIR}/error.log
    CustomLog \${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOL'

# Enable site and restart Apache
sudo a2ensite wordpress.conf
sudo a2enmod rewrite
sudo systemctl restart apache2

# Install SSL
sudo apt install certbot python3-certbot-apache -y
sudo certbot --apache

echo "Deployment complete: https://thereciperoom.site"
