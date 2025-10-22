# Jarkom-Modul-2-2025-K24

## 1. pembuatan topologi 
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






