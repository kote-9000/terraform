#! /bin/bash
sudo yum update httpd -y
sudo yum install -y httpd
sudo service httpd start
sudo systemctl enable httpd
echo "<h1> welcom to hyd devops ! AWS infra created using terraform created in ap-south-1 region </h1>" > var/www/html/index.html

# git install 
sudo yum install git -y