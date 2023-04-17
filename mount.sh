#!/bin/bash

function is_root() {
    if [[ $(id -u) -ne 0 ]]; then
        echo "need root"
        exit
    fi
}

function create_mount_point() {
    if [[ ! -d /mnt/extra ]]; then
        mkdir -p /mnt/extra
    fi
}

is_root
create_mount_point
mount /dev/sda1 /mnt/extra
