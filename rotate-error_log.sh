#!/bin/bash
IFS="$"
TLOG="/tmp/tmp_error_search.$$"
NOW=$(date +"%Y%m%d")

if [ -e ${TLOG} ]; then
   rm -f ${TLOG}
   /bin/touch ${TLOG}
   /bin/chmod 600 ${TLOG}
fi

cd /home   #Nice starting point

ls /var/cpanel/users | while read CPLN; do
    echo "$(date) I will now search ${CPLN}'s account for PHP error_log files ..."
    find /home/${CPLN}/public_html -type f -name 'error_log' > ${TLOG}
done

if [ -e ${TLOG} ]; then
  echo "$(date) I have built my list of error_log files and am now archiving those files ..."
  cat ${TLOG} | while read MLINE; do
     if [ -e ${MLINE}.bz2 ]; then
        rm -f ${MLINE}.bz2 
        echo "$(date) Removed old archive ${MLINE}.bz2 from hard drive ..."
     fi
     echo "$(date) Compressing ${MLINE} into new bzip2 archive ..."
     bzip2 -9 "${MLINE}"
  done
  rm -f ${TLOG}
fi
echo "$(date) Finished processing user error_log files ..."
# End of Script

# Credits: https://forums.cpanel.net/threads/error_log-how-big-does-it-grow.124209/post-541173
