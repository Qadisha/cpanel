#!/bin/bash

#DATE=$(date -d "-4 days" +%Y-%m-%d)
#DATE=$(date -d "yesterdat" +%Y-%m-%d)
DATE=$(date +%Y-%m-%d)
AFFECTEDACCOUNT=$(find /home -type f -name '.lastlogin' | xargs grep -R $DATE |awk -F"#" '{print $1}')

for account in $AFFECTEDACCOUNT
do
    SRCIP=$(echo "$account" |awk -F":" '{print $2}')
    curl https://ipinfo.io/$SRCIP
done

