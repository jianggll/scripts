#!/bin/sh

#setfont /usr/share/kbd/consolefonts/latarcyrheb-sun32.psfu.gz

echo '1) lat4-19.psfu.gz
2) lat4a-19.psfu.gz
3) LatArCyrHeb-19.psfu.gz
4) iso01-12x22.psfu.gz
5) iso02-12x22.psfu.gz
6) LatGrkCyr-12x22.psfu.gz
7) README.12x22
8) sun12x22.psfu.gz
9) latarcyrheb-sun32.psfu.gz
10) solar24x32.psfu.gz'
echo "default: 9"
echo -n ">>> "
read opt

case $opt in
1)
    font="lat4-19.psfu.gz"
    ;;
2)
    font="lat4a-19.psfu.gz"
    ;;
3)
    font="LatArCyrHeb-19.psfu.gz"
    ;;
4)
    font="iso01-12x22.psfu.gz"
    ;;
5)
    font="iso02-12x22.psfu.gz"
    ;;
6)
    font="LatGrkCyr-12x22.psfu.gz"
    ;;
7)
    font="README.12x22"
    ;;
8)
    font="sun12x22.psfu.gz"
    ;;
9)
    font="latarcyrheb-sun32.psfu.gz"
    ;;
10)
    font="solar24x32.psfu.gz"
    ;;
*)
    font="latarcyrheb-sun32.psfu.gz"
    exit
    ;;
esac

setfont /usr/share/consolefonts/$font
