# Tirion instalasi bind
apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

# Tirion pembuatan domain 
nano /etc/bind/named.conf.local

## isi dengan 
zone "k24.com" {
    type master;
    file "/etc/bind/k24/k24.com";
    notify yes;
    also-notify { 192.223.4.3; };      
    allow-transfer { 192.223.4.3; };  
};

mkdir /etc/bind/k24

# pembuatan file zone.template
nano /etc/bind/zone.template

## isi dengan
$TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     localhost. root.localhost. (
                        2025100401 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      k24.fa
@       IN      A       192.223.3.2   ; iP Tirion

cp /etc/bind/zone.template /etc/bind/k24/k24.fa
nano /etc/bind/arda/arda.fa

# restart
service bind9 restart

