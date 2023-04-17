#!/bin/bash

# prompt
prompt_ch() {
    echo "1) powersave"
    echo "2) performance"
    echo "3) default"
    echo "*) nothing"
    echo -n ">>> "
    read ch
}

set_cpu_mode() {
    echo $1 | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor &>/dev/null
}

is_root() {
    if [[ $(id -u) -ne 0 ]]; then
        echo "need root"
        exit 1
    fi
}

show_current_mode() {
    mode=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
    case $mode in
        powersave)      color="\e[0;32m" ;;
        performance)    color="\e[0;31m" ;;
        *)              color="\e[0;33m" ;;
    esac
    clean_color="\e[m"
    echo -e "current mode: ${color}${mode}${clean_color}"
}

is_root
prompt_ch
case $ch in
    1) set_cpu_mode powersave ;;
    2) set_cpu_mode performance ;;
    3) set_cpu_mode schedutil ;;
    *) ;;
esac
show_current_mode
