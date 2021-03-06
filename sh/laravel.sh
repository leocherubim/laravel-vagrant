#!/usr/bin/env bash
apt-get update

# installing dependencies
apt-get install -y libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
apt-get install -y curl vim wget git-core

# installing heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# installing postgresql
apt-get install -y postgresql postgresql-contrib
sudo -u postgres psql -c "create user root with password 'root';"
sudo -u postgres psql -c "alter user root with superuser;"
sudo -u postgres psql -c "create database test;"

# installing mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get update
apt-get install -y mysql-server
echo "create database test" | mysql -uroot -proot

# installing nodejs and dependencies (grunt, bower, gulp)
curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
apt-get install -y nodejs
apt-get install npm
npm install pm2 -g
npm install -g grunt-cli
npm install grunt --save-dev
npm install -g bower
npm install -g gulp

# installing PHP 5.6
apt-get install -y python-software-properties
add-apt-repository -y ppa:ondrej/php5-5.6
apt-get update
apt-get upgrade
apt-get install -y php5

# PHP extensions settings
apt-get install -y php5-curl php5-xdebug php5-mysql php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl php5-pgsql php5-json

# Composer setting
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# installing PHP Framework Laravel
composer global require "laravel/installer=~1.1"
sudo mv /root/.composer /home/vagrant/
chown -R vagrant:vagrant /home/vagrant/.composer

# setting the Laravel environment variable
echo PATH=\"\$HOME/.composer/vendor/bin/:\$PATH\" >> /home/vagrant/.profile

# installing phpunit
wget https://phar.phpunit.de/phpunit.phar
chmod +x phpunit.phar
mv phpunit.phar /usr/local/bin/phpunit