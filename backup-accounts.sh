#!/bin/bash
DOW=$(date +%a)

# Create Backup folder for a specific date
ssh -p23 HETZNERUSERNAME@HETZNERUSERNAME.your-storagebox.de mkdir -p QD/Webservers/www-01/$DOW

# Iterate Cpanel Accounts and make a backup
cd /var/cpanel/users
for user in *
do
	cd /home/$user
	mkdir -p /home/$user/qdbackup
	/scripts/pkgacct --compress $user qdbackup/
	rsync --progress -e 'ssh -p23' qdbackup/* HETZNERUSERNAME@HETZNERUSERNAME.your-storagebox.de:/home/QD/Webservers/www-01/$DOW
	rm -Rf qdbackup
done
