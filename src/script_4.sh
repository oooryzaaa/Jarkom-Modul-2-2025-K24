# Tirion instalasi bind
apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

# pembuatan zona nya
mkdir -p /etc/bind/zones

# Tirion pembuatan domain 
nano /etc/bind/named.conf.local

## isi dengan 
cat <<EOF > /etc/bind/named.conf.local
zone "k24.com" {
    type master;
    file "/etc/bind/db.k24.com";
    notify yes;
    also-notify { 192.223.3.4; };      
    allow-transfer { 192.223.3.4; };  
};
EOF

# isi dengan, untuk soa ns
nano /etc/bind/db.k24.com

$TTL 604800
@     IN   SOA   ns1.k24.com. root.k24.com. (
            2025101301 ; Serial
            604800     ; Refresh
            86400      ; Retry
            2419200    ; Expire
            604800 )   ; Negative Cache TTL
;
@     IN   NS   ns1.k24.com.
@     IN   NS   ns2.k24.com.

ns1   IN   A    192.223.3.3   ; Tirion
ns2   IN   A    192.223.3.4   ; Valmar

@     IN   A    192.223.3.2   ; Sirion sebagai front door



# 
nano /etc/bind/named.conf.options

# isi dengan
cat <<EOF > /etc/bind/named.conf.options
options {
    directory "/var/cache/bind";

    recursion yes;                   
    allow-query { any; };            
    forwarders {
        192.168.122.1;               
    };

    dnssec-validation no;
    listen-on { any; };
    listen-on-v6 { any; };
};
EOF

# restart
service bind9 restart
# Sudo named-checkconf                
# sudo named-checkzone k24.com /etc/bind/zones/db.k24.com


## fokus pada ns2
# valmar instalasi bind
apt-get update
apt-get install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9

# pembuatan zona nya
mkdir -p /etc/bind/zones

# valmar pembuatan domain 
nano /etc/bind/named.conf.local

# isi dengan 
cat <<EOF > /etc/bind/named.conf.local
zone "k24.com" {
    type slave;
    masters { 192.223.3.3; };    
    file "/var/lib/bind/db.k24.com";
};
EOF

service bind9 restart

# Untuk pengisian interface di sirion ataupun client lainnya
nano /etc/resolv.conf

# isi dengan 
cat <<EOF > /etc/resolv.conf
search k24.com
nameserver 192.223.3.3  # Tirion
nameserver 192.223.3.4  # Valmar
nameserver 192.168.122.1
EOF

# pengecekan di siriom
ping k24.com