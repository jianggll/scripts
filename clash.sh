#!/bin/bash
# vim: foldmethod=marker

# variables {{{

application="${HOME}/.local/bin/clash"
work_directory="${HOME}/.config/clash"
log_file="/tmp/clash.log"

# }}}

# functions {{{

kill_exits_process() {
    echo "kill exits process"
    pkill clash
}

start_clash() {
    echo -e "start clash proxy server..."
    ${application} -d ${work_directory} >> ${log_file} 2>&1 &
    echo "log file: ${log_file}"
}

# }}}

kill_exits_process
start_clash
