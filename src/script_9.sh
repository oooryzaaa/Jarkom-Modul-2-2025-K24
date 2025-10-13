# lindon
# Instal Nginx:
apt-get install nginx -y

#Buat direktori dan file statis:
mkdir -p /var/www/html/annals
echo "<h1>Arsip Annals Lindon</h1>" > /var/www/html/annals/index.html
echo "<h1>File Rahasia</h1>" > /var/www/html/annals/secret.txt

#Tambahkan:
server {
    listen 80;
    server_name static.k24.com;

    root /var/www/html;
    index index.html;

    location /annals/ {
        autoindex on;
    }
}

#Restart Nginx:
service nginx restart

#Uji dari client (cirdan):
curl http://static.k24.com/annals/
