#! /bin/bash
echo "Eneter email:"
scrpt_dir="/root/.scripts"
if [ ! -d "$scrpt_dir" ]
then
	mkdir $scrpt_dir
fi
read -r EMAILs
echo "EMAIL=$EMAIL" > $scrpt_dir/.au.conf
mv sysupdate.sh $scrpt_dir
chown root: $scrpt_dir/sysupdate.sh
chmod 744 $scrpt_dir/sysupdate.sh
ln -sf $scrpt_dir/sysupdate.sh /bin/auto_sysupdate
crontab -l | { cat; echo "0 0 * * Mon /bin/auto_sysupdate"; } | crontab -