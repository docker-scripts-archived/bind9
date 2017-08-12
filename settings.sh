APP=bind9

IMAGE=bind9
CONTAINER=bind9
PORTS="53:53"

### Public IP of the host.
PUBLIC_IP=10.11.12.13

### Check these:
### https://www.buddyns.com
### https://puck.nether.net/
### http://networking.ringofsaturn.com/Unix/freednsservers.php
SECONDARY_NS="b.ns.buddyns.com c.ns.buddyns.com puck.nether.net"
AXFR_SERVERS="
    173.244.206.26;   # a.transfer.buddyns.com
    88.198.106.11;    # b.transfer.buddyns.com
    204.42.254.5;     # puck.nether.net
"

### Email account for sending server notifications.
GMAIL_ADDRESS=
GMAIL_PASSWD=
