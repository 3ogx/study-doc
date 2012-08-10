#!/bin/sh

# sed
    tail -n 2 /var/log/sysem.log | sed -e 's/\ /-/g' -e 's/:/-/g' -e 's/\[\([0-9+] ]\)\]/[+]/g' | cut -d + -f 1 | sed 's/\[//g'

# awk 刪除python版本小於2.7的目錄
    ls -al | awk -F: '{if ($1 < 2.7) {print $1}}' | xargs rm -rf
