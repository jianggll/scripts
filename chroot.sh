#!/bin/bash

if [[ $(id -u) -ne 0 ]]; then
    echo "root needed"
    exit 1
fi

target=${1:-/mnt/gentoo}
echo $target

#mount /dev/nvme0n1p12 $target
cp --dereference /etc/resolv.conf $target/etc/
mount --types proc /proc $target/proc
mount --rbind /sys $target/sys
mount --make-rslave $target/sys
mount --rbind /dev $target/dev
mount --make-rslave $target/dev
mount --bind /run $target/run
mount --make-slave $target/run
