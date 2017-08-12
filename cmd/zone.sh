cmd_zone_help() {
    cat <<_EOF
    zone (add | rm | en | dis) <domain>
        Manage domain zones.

_EOF
}

cmd_zone() {
    local do=$1
    local domain=$2
    [[ -n $domain ]] || fail "Usage:\n$(cmd_zone_help)"

    case $do in
        add|rm|dis|en)
            _zone_$do $domain
            ds exec service bind9 restart
            ;;
        *)
            fail "Usage:\n$(cmd_zone_help)"
            ;;
    esac
}

_zone_add() {
    local domain=$1

    _zone_rm $domain

    cp etc-bind/zone/{example.org.conf,$domain.conf}
    sed -i etc-bind/zone/$domain.conf -e "s/example.org/$domain/g"

    cp etc-bind/zone/{example.org.db,$domain.db}
    sed -i etc-bind/zone/$domain.db -e "s/example.org/$domain/g"

    _zone_en $domain
}

_zone_rm() {
    local domain=$1
    rm -f etc-bind/zone/$domain.*
    sed -i etc-bind/named.conf -e "/$domain/d"
}

_zone_dis() {
    local domain=$1
    sed -i etc-bind/named.conf -e "/$domain/d"
    echo '#include "zone/'$domain'.conf";' >> etc-bind/named.conf
}

_zone_en() {
    local domain=$1
    sed -i etc-bind/named.conf -e "/$domain/d"
    echo 'include "zone/'$domain'.conf";' >> etc-bind/named.conf
}
