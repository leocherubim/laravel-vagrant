# VAGRANT + LARAVEL 5.1
This project consists of a single vagrant box with shell script provisioning for PHP framework Laravel with laravel command working.

In this box, are present:

- Git
- Heroku-Toolbelt
- PostgreSQL 9
- MySQL 5
- NodeJS 0.12 (PM2, Grunt, Bower, Gulp)
- PHP 5.6.10
- Composer
- Laravel 5.1

The Laravel the environment variables are already set to speed to maximum productivity. Then just need to run the vagrant box and begin to start a new project Laravel:

 $ laravel new Your-Project

To test the application in vagrant server on the local server uses the host 0.0.0.0. Following is the complete command:

 $ php artisan serves host = 0.0.0.0 --port = 4000
