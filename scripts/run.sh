#!/bin/bash

echo "<VirtualHost *:8080>
  ServerName   "$APPLICATION_HOSTNAME"
  DocumentRoot /var/www/"$APPLICATION_NAME"/public

  SetEnv APPLICATION_ENV ${APPLICATION_ENV}

  <Directory \"/var/www/$APPLICATION_NAME/public\">
    Require all granted
    AllowOverride All
  </Directory>
</VirtualHost>" > "/etc/apache2/sites-enabled/"$APPLICATION_HOSTNAME".conf"



service php5-fpm start
service apache2 start