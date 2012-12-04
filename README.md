# Symfony skeleton

## Installation

### Install composer

    curl -s http://getcomposer.org/installer | php

### Install symfony skeleton

Light version

    composer.phar create-project rithis/symfony-skeleton <target-directory> dev-master

With Doctrine ORM

    composer.phar create-project rithis/symfony-skeleton <target-directory> dev-orm

With Doctrine ORM and Sonata Admin

    composer.phar create-project rithis/symfony-skeleton <target-directory> dev-admin

## Web Servers

Better way to start server is `php app/console server:run`, but sometimes web servers is necessary.

### apache

```
<VirtualHost *:80>
    DocumentRoot /var/www
    RewriteEngine On
    RewriteCond %{DOCUMENT_ROOT}%{REQUEST_URI} !-f
    RewriteRule ^ /app_dev.php
</VirtualHost>
```

### nginx

```
server {
    root /var/www;

    location / {
        location ~ \.php$ {
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            include fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        }

        try_files $uri @backend;
    }

    location @backend {
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root/app_dev.php;
    }
}
```
