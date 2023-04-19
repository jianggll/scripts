#!/bin/bash
# Usage: . ./proxy.sh
# vim: foldmethod=marker

# functions {{{
set_proxy() {
    export http_proxy=$1
    export https_proxy=$1
    export ftp_proxy=$1
}

prompt_to_input_server() {
    echo -n "server: "
    read server
}

unset_proxy() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
}

prompt_to_input() {
    echo "1) default(http://127.0.0.1:7890)"
    echo "2) enter your server"
    echo "3) clear proxy"
    echo "*) nothing"
    echo -n "> "
    read ch
}

do_something_by_input() {
    case $ch in
        1) set_proxy http://127.0.0.1:7890 ;;
        2) prompt_to_input_server; set_proxy $server ;;
        3) unset_proxy ;;
        *) ;;
    esac
}

show_current_proxy() {
    color_green="\e[0;32m"
    color_clean="\e[m"
    echo "--------------------------------"
    echo "current proxy:"
    echo -e "http_proxy=${color_green}$http_proxy${color_clean}"
    echo -e "https_proxy=${color_green}$https_proxy${color_clean}"
    echo -e "ftp_proxy=${color_green}$ftp_proxy${color_clean}"
}
# }}}

prompt_to_input
do_something_by_input
show_current_proxy
