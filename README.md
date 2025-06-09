# 🍲 The Recipe Room — Cloud Server Deployment (ICT171 Assignment 2)

This project showcases the deployment of a dynamic WordPress website on an AWS EC2 instance using Apache2, MySQL, PHP, SSL, and domain integration.

---

## 📌 Student Details

- *Name*: Krushang Sakhareliya  
- *Student ID*: 34976955  
- *Unit*: ICT171 Cloud Server Project  
- *Project Title*: The Recipe Room

---

## 🌐 Live Website

- *Main Site*: [https://thereciperoom.site](https://thereciperoom.site)  
- *WordPress Admin*: [https://thereciperoom.site/wp-admin](https://thereciperoom.site/wp-admin)

---

## 📹 Video Explainer

Watch the full project walkthrough on Echo360:  
🔗 [Video Link](https://echo360.net.au/media/f708f9a3-c1fe-47aa-aecd-85e63fdbd9c4/public)

*Note: A secondary site was deployed on thereciperoom.space for video demo purposes.*

---

## ⚙ Technologies Used

| Component        | Technology            |
|------------------|------------------------|
| Cloud Platform   | AWS EC2 (Ubuntu 22.04) |
| Web Server       | Apache2                |
| Backend          | PHP, MySQL             |
| CMS              | WordPress              |
| SSL/TLS          | Certbot (Let's Encrypt)|
| Domain Provider  | Hostinger              |

---

## 🛠 Setup Script

A full Bash deployment script is provided to automate Apache, PHP, MySQL, WordPress setup, and SSL configuration.

### ➤ How to use

```bash
chmod +x setup.sh
./setup.sh 
