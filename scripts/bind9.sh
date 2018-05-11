#!/bin/bash -x

source /host/settings.sh

### fix default options
sed -i /etc/default/bind9 \
    -e '/^OPTIONS=/ c OPTIONS="-4 -u bind"'

### disable IPv6 for ufw
sed -i /etc/default/ufw \
    -e '/^IPV6/ c IPV6=no' \
    -e 's/^IPT_MODULES=/#IPT_MODULES=/'

### add ufw rules for allowing axfr servers
while read line; do
    [[ -z $line ]] && continue
    server_ip=$(echo $line | cut -d';' -f1)
    ufw allow from $server_ip to any port 53
done <<< "$AXFR_SERVERS"
ufw enable

### fix config files
sed -i /etc/bind/zone/example.org.db \
    -e "s/127\.0\.0\.1/$PUBLIC_IP/"

cat <<_EOF > /etc/bind/conf/allow-transfer
allow-transfer {
    127.0.0.1;  # for debugging $AXFR_SERVERS};
_EOF

cat <<_EOF > /etc/bind/conf/also-notify
also-notify {$AXFR_SERVERS};
_EOF

> /etc/bind/conf/secondary.ns
for ns in $SECONDARY_NS; do
    echo "  IN  NS  ${ns}." >> /etc/bind/conf/secondary.ns
done
