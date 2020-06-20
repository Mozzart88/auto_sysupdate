#! /bin/bash
source /root/.scripts/.au.conf
date=$(date +'%D %R')
tmp="/tmp/sysupdater"
log="/var/log/auto_sysupdate.log"
err_log="/var/log/auto_sysupdate.error.log"
PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

echo "=== START UPDATE : $date" >> $log
apt update 2> $tmp 1>> $log
apt upgrade -y 2>> $tmp 1>> $log
apt autoremove -y 2>> $tmp 1>> $log
if [ -f /var/run/reboot-required ]
then
	echo "Server <b>$(hostname)</b> need to reboot" | mail -r sysupdater@mozzdev.com  -s "Need to reboot" -a "Content-Type: text/html" $EMAIL
fi
if [ -f $tmp ]
then
	/usr/bin/printenv >> $tmp
	mail -r sysupdater@mozzdev.com  -s "SysUpdate Err-Log" -a "Content-Type: text/plain" timokhovim@gmail.com < $tmp
	echo "=== START UPDATE : $date" >> $err_log
	cat $tmp >> $err_log
	echo -e "\n" >> $err_log
	unlink $tmp
fi
echo -e "\n" >> $log
