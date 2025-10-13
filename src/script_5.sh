#di root tirion

DOMAIN="k24.com"
HOSTNAME="tirion"
DNS_SERVER="192.223.3.3"

#s set hostname nya
echo "$HOSTNAME" > /etc/hostname
hostname "$HOSTNAME"

cat > /etc/hosts <<EOF
127.0.0.1   localhost
$DNS_SERVER $HOSTNAME.$DOMAIN $HOSTNAME
EOF

cat > /etc/resolv.conf <<EOF
search $DOMAIN
nameserver $DNS_SERVER
nameserver $ALT_DNS_SERVER
EOF

hostname -f
ping -c 2 tirion.k24.com

nano /etc/hosts

127.0.0.1       localhost
192.223.3.3     tirion.k24.com tirion
192.223.3.5     valmar.k24.com valmar
192.223.3.6     lindon.k24.com lindon
192.223.3.7     vingilot.k24.com vingilot
192.223.3.8     eonwe.k24.com eonwe
192.223.3.9     earendil.k24.com earendil
192.223.3.10    elwing.k24.com elwing
192.223.3.11    cirdan.k24.com cirdan
192.223.3.12    elrond.k24.com elrond
192.223.3.13    maglor.k24.com maglor
192.223.3.14    sirion.k24.com sirion

#coba cek
ping -c 3 tirion.k24.com
ping -c 3 valmar.k24.com
ping -c 3 eonwe.k24.com

# dalam db tirion 
nano /etc/bind/db.k24.com

# isi dengan 
; === Router dan Host ===
eonwe      IN  A  192.223.1.1
earendil   IN  A  192.223.1.2
elwing     IN  A  192.223.1.3
cirdan     IN  A  192.223.2.2
elrond     IN  A  192.223.2.3
maglor     IN  A  192.223.2.4
sirion     IN  A  192.223.3.2
tirion     IN  A  192.223.3.3
valmar     IN  A  192.223.3.4
lindon     IN  A  192.223.3.5
vingilot   IN  A  192.223.3.6

