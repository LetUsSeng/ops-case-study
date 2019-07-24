#!/bin/bash

echo "###### Running provision script on instance ######"
sudo yum -y update && sudo yum install -y vim
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

sudo yum --enablerepo=remi,remi-php71 install -y httpd php php-common
sudo yum --enablerepo=remi,remi-php71 install -y php-cli php-pear php-pdo php-mysqlnd php-gd php-mbstring php-mcrypt php-xml

sudo systemctl start httpd.service 
sudo systemctl enable httpd.service

echo -n "
<html>
 <head>
  <title>Hello World</title>
 </head>
 <body>
 <p>Hello World from: <?php echo file_get_contents('http://169.254.169.254/latest/meta-data/public-ipv4'); ?> </p> 
 </body>
</html>
" > /tmp/index.php

sudo chmod apache:apache /var/www/html
sudo mv /tmp/index.php /var/www/html/