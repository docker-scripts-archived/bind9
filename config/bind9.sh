#!/bin/bash -x

### fix default options
sed -i /etc/default/bind9 \
    -e '/^OPTIONS=/ c OPTIONS="-4 -u bind"'

### disable IPv6 for ufw
sed -i /etc/default/ufw \
    -e '/^IPV6/ c IPV6=no' \
    -e 's/^IPT_MODULES=/#IPT_MODULES=/'

### add ufw rules for bind9
ufw allow from 173.244.206.26 to any port 53
ufw allow from 88.198.106.11 to any port 53
ufw allow from 204.42.254.5 to any port 53

### start ufw, also on reboot
ufw enable
cat <<_EOF > /etc/rc.local
#!/bin/sh -e
ufw enable
exit 0
_EOF
