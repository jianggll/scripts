#!/bin/bash

cd $1
[[ $? -ne 0 ]] && exit

for item in *; do
    du -sh $item | grep -E '[0-9]+[MG]'
done

for item in .*; do
    if [[ $item != . ]] && [[ $item != .. ]]; then
        du -sh $item | grep -E '[0-9]+[MG]'
    fi
done
