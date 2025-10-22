# Jarkom-Modul-2-2025-K24

## 1. pembuatan topologi 
penetapan alamat IP dan default gateway untuk setiap host berdasarkan pembagian jalur: Barat, Timur, dan DMZ, dengan Eonwe bertindak sebagai router sentral (default gateway) untuk semua jalur internal.
![alt text](/image/image_1.png)

## 2. 
![alt text](/image/image_2.png)

## 3.
![alt text](/image/image_toelrond.png)
![alt text](/image/image_tosirion.png)

## 4. 
![alt text](/image/image_4.png)

## 6.

### di tirion isi dengan record
```
$TTL 604800
@     IN   SOA   ns1.k24.com. root.k24.com. (
            2025101302 ; Serial
            604800     ; Refresh
            86400      ; Retry
            2419200    ; Expire
            604800 )   ; Negative Cache TTL
;
@     IN   NS   ns1.k24.com.
@     IN   NS   ns2.k24.com.

; A Records
ns1     IN   A    192.223.3.3   ; Tirion
ns2     IN   A    192.223.3.4   ; Valmar
sirion  IN   A    192.223.3.2
lindon  IN   A    192.223.3.5
vingilot IN  A    192.223.3.6

; CNAME Records
www     IN   CNAME sirion
static  IN   CNAME lindon
app     IN   CNAME vingilot
```
### cek serial SOA di tirion dan valmar
```
dig @192.223.3.3 k24.com SOA
dig @192.223.3.4 k24.com SOA
```
## 7.
#Edit /etc/bind/db.k24.com di Tirion:
nano /etc/bind/db.k24.com

#Tambahkan record berikut:
```
$TTL 604800
@     IN   SOA   ns1.k24.com. root.k24.com. (
            2025101302 ; Serial (naikkan!)
            604800     ; Refresh
            86400      ; Retry
            2419200    ; Expire
            604800 )   ; Negative Cache TTL
;
@     IN   NS   ns1.k24.com.
@     IN   NS   ns2.k24.com.

; A Records
ns1   IN   A    192.223.3.3   ; Tirion
ns2   IN   A    192.223.3.4   ; Valmar
@     IN   A    192.223.3.2   ; Sirion
sirion   IN   A    192.223.3.2
lindon   IN   A    192.223.3.5
vingilot IN   A    192.223.3.6

; CNAME Records
www    IN   CNAME sirion
static IN   CNAME lindon
app    IN   CNAME vingilot
```

Restart Bind9 di Tirion:
`service bind9 restart`

service bind9 restart
`dig @192.223.3.4 lindon.k24.com`
# 8.

##tirion
##nano /etc/bind/named.conf.local di 
```
zone "3.223.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.192.223.3";
    notify yes;
    also-notify { 192.223.3.4; };
    allow-transfer { 192.223.3.4; };
};
```
# nano /etc/bind/db.192.223.3
```
$TTL 604800
@ IN SOA ns1.k24.com. root.k24.com. (
      2025101301 ; Serial
      604800     ; Refresh
      86400      ; Retry
      2419200    ; Expire
      604800 )   ; Negative Cache TTL
;
@ IN NS ns1.k24.com.
@ IN NS ns2.k24.com.

2 IN PTR sirion.k24.com.
5 IN PTR lindon.k24.com.
6 IN PTR vingilot.k24.com.
```
## valmar
##Edit /etc/bind/named.conf.local:
`nano /etc/bind/named.conf.local`

#tambahkan:
```
zone "3.223.192.in-addr.arpa" {
    type slave;
    masters { 192.223.3.3; };
    file "/var/lib/bind/db.192.223.3";
};
```
#Restart Bind9 di kedua server, lalu uji:
```
dig @192.223.3.3 -x 192.223.3.2
dig @192.223.3.4 -x 192.223.3.5
```
# 9.

## lindon
# #Instal Nginx:
`apt-get install nginx -y`

##Buat direktori dan file statis:
```
mkdir -p /var/www/html/annals
echo "<h1>Arsip Annals Lindon</h1>" > /var/www/html/annals/index.html
echo "<h1>File Rahasia</h1>" > /var/www/html/annals/secret.txt
```
##Tambahkan:
```
server {
    listen 80;
    server_name static.k24.com;

    root /var/www/html;
    index index.html;

    location /annals/ {
        autoindex on;
    }
}
```
##Restart Nginx:
`service nginx restart`

##Uji dari client (cirdan):
`curl http://static.k24.com/annals/`
# 10.









