cmd_create_help() {
    cat <<_EOF
    create
        Create the wsproxy container '$CONTAINER'.

_EOF
}

rename_function cmd_create orig_cmd_create
cmd_create() {
    cp -rn $APP_DIR/config/etc-bind .

    # NET_ADMIN needed for iptables
    orig_cmd_create \
        --cap-add=NET_ADMIN \
        -v $(pwd)/etc-bind:/etc/bind
}
