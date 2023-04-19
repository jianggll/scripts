#!/bin/bash
# vim: foldmethod=marker

# variables {{{

color_red="\e[0;31m"
color_clean="\e[m"
color_green="\e[0;32m"
path_to_site="${HOME}/code/clash-dashboard/dist"
log_file="/tmp/python3.http.server.log"

# }}}

# functions {{{

kill_exits_server() {
    echo -e "${color_red}kill${color_clean} exist process"
    echo -e "\$ ${color_red}pkill${color_clean} python3"
    pkill python3
}

start_server() {
    echo -e "${color_green}start server...${color_clean}"
    echo "\$ python3 -m http.server 8000 -b 127.0.0.1 -d ${path_to_site}"
    python3 -m http.server 8000 -b 127.0.0.1 -d ${path_to_site} >> ${log_file} 2>&1 &
    echo "log file: ${log_file}"
}

# }}}

kill_exits_server
start_server
