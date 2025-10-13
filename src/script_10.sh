# Vingilot 
#Instal Nginx & PHP-FPM:
apt-get install nginx php8.4-fpm -y

#Edit konfigurasi Nginx:
nano /etc/nginx/sites-available/default
#isi:
server {
    listen 80;
    server_name app.k24.com;

    root /var/www/html;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.4-fpm.sock;
    }

    location /about {
        rewrite ^/about$ /about.php last;
    }
}

#Buat file PHP:
echo "<?php echo '<h1>Home</h1>'; ?>" > /var/www/html/index.php
echo "<?php echo '<h1>About</h1>'; ?>" > /var/www/html/about.php

#Restart Nginx & PHP-FPM:
service nginx restart
service php8.4-fpm restart

#Uji dari client:
curl http://app.k24.com/
curl http://app.k24.com/about
