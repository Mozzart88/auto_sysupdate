#! /bin/bash
scrpt_dir="/root/.scripts"
crontab_weekly="/etc/cron.weekly"
if [ ! -d "$scrpt_dir" ]
then
	mkdir $scrpt_dir
fi
if [ -z $EMAIL ]
then
	echo "Eneter email:"
	read -r EMAIL
fi
echo "EMAIL=$EMAIL" > $scrpt_dir/.au.conf
mv sysupdate.sh $crontab_weekly/sysupdate
if [ $? -ne 0 ]
then
	exit $?
fi
chown root: $crontab_weekly/sysupdate
chmod 744 $crontab_weekly/sysupdate
