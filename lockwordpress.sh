#!/bin/bash

DOMAINNAME=
ACTION=
USERNAME=$(cat /etc/userdomains  |grep $DOMAINNAME |awk '{print $2}' |head -1)

if [ $ACTION = "lock" ]
then
        find /home/$USERNAME/public_html -type f -name '*.php' -exec chown lockeduser:$USERNAME {} \;
        find /home/$USERNAME/public_html -type f -name '*.js' -exec chown lockeduser:$USERNAME {} \;
fi

if [ $ACTION = "unlock" ]
then
        find /home/$USERNAME/public_html -type f -name '*.php' -exec chown $USERNAME:$USERNAME {} \;
        find /home/$USERNAME/public_html -type f -name '*.js' -exec chown $USERNAME:$USERNAME {} \;
fi


