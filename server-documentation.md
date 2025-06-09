# ICT171 Assignment 2: Cloud Project & Video Explainer

**Name:** Krushang Sakhareliya  
**Student ID:** 34976955  

---

## 📑 INDEX

1. [Project Overview](#1-project-overview)  
2. [Development Steps](#2-development-steps)  
   - [2.1 Launch EC2 Instance](#21-launch-ec2-instance)  
   - [2.2 Install Dependencies](#22-install-dependencies)  
   - [2.3 Domain Purchase](#23-domain-purchase)  
   - [2.4 Download and Setup WordPress](#24-download-and-setup-wordpress)  
   - [2.5 Enable SSL and Site](#25-enable-ssl-and-site)  
3. [Full Bash Deployment Script](#3-full-bash-deployment-script)  
4. [Links](#4-links)  

---

## 1. PROJECT OVERVIEW

This document details the step-by-step process used to deploy a live WordPress site hosted at [https://thereciperoom.site](https://thereciperoom.site) using an AWS EC2 Ubuntu server, Apache, SSL, and custom configuration. The goal was to host WordPress in a subdirectory (`/wordpress`) while making it accessible directly from the domain root.

### 1.1 Website and Hosting Details

| Detail          | Main Website                      | Video Demo Website                |
|-----------------|-----------------------------------|----------------------------------|
| Domain          | thereciperoom.site                | thereciperoom.space              |
| WordPress Admin | /wp-admin/                        | /wp-admin/                       |
| IP Address      | 3.106.112.57                      | 54.252.23.4                      |
| Hosting         | AWS EC2                           | AWS EC2                          |
| OS              | Ubuntu                            | Ubuntu                           |
| Web Server      | Apache2                           | Apache2                          |
| SSL             | Self-signed or Certbot enabled    | Certbot with Apache              |
| Domain Provider | Hostinger                         | Hostinger                        |
| Video Hosting   | -                                 | ECO360                           |

---

## 2. DEVELOPMENT STEPS

### 2.1 Launch EC2 Instance

- Log in to AWS EC2 Dashboard.
- Launch an instance with Ubuntu Server.
- Allocate an Elastic IP and associate it with the instance.

### 2.2 Install Dependencies

```bash
sudo apt update
sudo apt install apache2
sudo apt install php libapache2-mod-php php-mysql
```

### 2.3 Domain Purchase

- Domain was purchased from [Hostinger](https://www.hostinger.com/).
- DNS was configured to point to the EC2 instance IP.

### 2.4 Download and Setup WordPress

```bash
sudo apt install mysql-server
sudo mysql
```

Inside MySQL shell:

```sql
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Testpass@123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
EXIT;
```

Download and configure WordPress:

```bash
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
sudo mkdir -p /var/www/html/wordpress
sudo mv wordpress/ /var/www/html/
```

Apache virtual host configuration:

```bash
sudo nano /etc/apache2/sites-available/wordpress.conf
```

Paste the following:

```apache
<VirtualHost *:80>
    ServerAdmin admin@thereciperoom.site
    ServerName thereciperoom.site
    ServerAlias www.thereciperoom.site
    DocumentRoot /var/www/html/wordpress

    <Directory /var/www/html/wordpress/>
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

Enable the site and restart Apache:

```bash
sudo a2ensite wordpress.conf
sudo systemctl restart apache2
```

### 2.5 Enable SSL and Site

Install Certbot and enable SSL:

```bash
sudo apt install certbot python3-certbot-apache
sudo certbot --apache
```

---

## 3. FULL BASH DEPLOYMENT SCRIPT

```bash
# Update & Install
sudo apt update
sudo apt install apache2
sudo apt install php libapache2-mod-php php-mysql
sudo apt install mysql-server

# MySQL setup
sudo mysql
# Inside MySQL
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'Testpass@123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
EXIT;

# WordPress setup
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz
sudo mkdir -p /var/www/html/wordpress
sudo mv wordpress/ /var/www/html/

# Apache configuration
sudo nano /etc/apache2/sites-available/wordpress.conf
# (Insert virtual host config as above)

sudo a2ensite wordpress.conf
sudo systemctl restart apache2

# SSL Setup
sudo apt install certbot python3-certbot-apache
sudo certbot --apache
```

---

## 4. LINKS

### 📹 Video Link
[Echo360 Video Link](https://echo360.net.au/media/f708f9a3-c1fe-47aa-aecd-85e63fdbd9c4/public)

### 🌐 Live Websites

- Main Site: [https://thereciperoom.site](https://thereciperoom.site)
- Admin Panel: [https://thereciperoom.site/wp-admin/](https://thereciperoom.site/wp-admin/)
- Video Site: [https://thereciperoom.space](https://thereciperoom.space)
- Admin Panel: [https://thereciperoom.space/wp-admin/](https://thereciperoom.space/wp-admin/)

### 🔗 GitHub Repo

[https://github.com/krushang-S/ict171-cloud-server-34976955](https://github.com/krushang-S/ict171-cloud-server-34976955)
