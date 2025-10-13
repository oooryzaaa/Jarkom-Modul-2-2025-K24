#tirion
#nano /etc/bind/named.conf.local di 
zone "3.223.192.in-addr.arpa" {
    type master;
    file "/etc/bind/db.192.223.3";
    notify yes;
    also-notify { 192.223.3.4; };
    allow-transfer { 192.223.3.4; };
};
# nano /etc/bind/db.192.223.3
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

# valmar
#Edit /etc/bind/named.conf.local:
nano /etc/bind/named.conf.local

#tambahkan:
zone "3.223.192.in-addr.arpa" {
    type slave;
    masters { 192.223.3.3; };
    file "/var/lib/bind/db.192.223.3";
};

#Restart Bind9 di kedua server, lalu uji:

dig @192.223.3.3 -x 192.223.3.2
dig @192.223.3.4 -x 192.223.3.5
