#Edit /etc/bind/db.k24.com di Tirion:
nano /etc/bind/db.k24.com

#Tambahkan record berikut:
'''$TTL 604800
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
app    IN   CNAME vingilot'''

Restart Bind9 di Tirion:
'service bind9 restart'

service bind9 restart
dig @192.223.3.4 lindon.k24.com

