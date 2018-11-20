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

### SMTP server for sending notifications. You can build an SMTP server
### as described here:
### https://github.com/docker-scripts/postfix/blob/master/INSTALL.md
### Comment out if you don't have a SMTP server and want to use
### a gmail account (as described below).
SMTP_SERVER=smtp.example.org
SMTP_DOMAIN=example.org

### Gmail account for notifications. This will be used by ssmtp.
### You need to create an application specific password for your account:
### https://www.lifewire.com/get-a-password-to-access-gmail-by-pop-imap-2-1171882
GMAIL_ADDRESS=
GMAIL_PASSWD=
