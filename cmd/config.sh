cmd_config_help() {
    cat <<_EOF
    config
        Run configuration scripts inside the container.

_EOF
}

cmd_config() {
    is_up || ds start && sleep 3

    ds runcfg set_prompt
    ds runcfg ssmtp
    ds runcfg bind9

    ds restart
}
