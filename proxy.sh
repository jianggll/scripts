#!/bin/bash
# Usage: . ./proxy.sh

set_proxy()
{
    export http_proxy=$1
    export https_proxy=$1
    export ftp_proxy=$1
}

unset_proxy()
{
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
}

prompt_ch()
{
    echo "1) default(http://127.0.0.1:7890)"
    echo "2) server by enter"
    echo "3) unset proxy"
    echo "*) nothing"
    echo -n ">>> "
    read ch
}

show_current_proxy()
{
    echo "http_proxy: $http_proxy"
    echo "https_proxy: $https_proxy"
    echo "ftp_proxy: $ftp_proxy"
}

prompt_ch
case $ch in
    1)
        set_proxy http://127.0.0.1:7890
        ;;
    2)
        echo -n "server: "
        read server
        set_proxy $server
        ;;
    3)
        unset_proxy
        ;;
    *)
        ;;
esac
echo "--------after--------"
show_current_proxy
