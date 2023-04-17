#!/bin/bash

pkill clash
echo -e "...start \e[0;32mclash\e[m proxy server..."
clash -d ${HOME}/.config/clash &>/dev/null &
