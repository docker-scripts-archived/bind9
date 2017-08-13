bind9
=====

This is a **hidden**, **master**, **authoritative-only** name-server, which helps you to manage yourself your domains.

**Hidden** means that it stays behind a firewall, not accessible from the outside world. **Master** or **primary** means that it is a primary source of information for the domains that it provides. There are also **slave/secondary** DNS servers, which get the information of the domains that they cover from other (master/primary) servers. If we update the domain on a master server, the slaves will synchronise with it automatically after a certain time.

**Authoritative-only** means that the server will just give answers for the domains that it masters, and nothing else. DNS servers can possibly do several things, for example give answers to DNS requests from clients, both for the domains that they are responsible for and for other domains. If they don't know the answer, they get it from the Internet, fetch it to the client and then cache it for future requests. However this server does not do any of these things. It just answers for its own domains.

See also this: [docs/how-to-manage-your-own-name-server.org](https://github.com/dashohoxha/bind9/blob/master/docs/how-to-manage-your-own-name-server.org)


## Installation

  - First install `ds`:
     + https://github.com/docker-scripts/ds#installation

  - Then get the scripts from github: `ds pull bind9`

  - Create a directory for the container: `ds init bind9 @bind9`

  - Fix the settings: `cd /var/ds/bind9/ ; vim settings.sh`

  - Build image, create the container and configure it: `ds make`

## Usage

    zone (add | rm | en | dis) <domain>
        Manage domain zones.

## Troubeshooting

    cd /var/ds/bind9/
    ds shell
    service bind9 restart
    service bind9 status
    tail -n 100 /var/log/syslog
    dig example.org axfr @127.0.0.1
    ufw status
