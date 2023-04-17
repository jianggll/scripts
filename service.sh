#!/bin/bash

color_red="\e[0;31m"
color_green="\e[0;32m"
color_clean="\e[m"

echo "kill exist clash server..."
pkill clash
echo "kill exist manager server..."
pkill python3
echo ""

echo "----start clash----"
clash -d /home/nangua/.config/clash &>/dev/null &
echo -e "use ${color_green}tail -f ${HOME}/clash.log${color_clean} to see log"
echo -e "use ${color_red}pkill clash${color_clean} to stop clash"
echo ""

echo "----start service to manage clash in web----"
python3 -m http.server -b 127.0.0.1 -d ${HOME}/src/clash-dashboard/dist &>/dev/null &
echo -e "use ${color_green}http://localhost:8000${color_clean} or ${color_green}http://127.0.0.1:8000${color_clean} to manage clash"
echo -e "use ${color_green}tail -f ${HOME}/python.http.log${color_clean} to see log"
echo -e "use ${color_red}pkill python3${color_clean} to stop dashboard"
echo ""
