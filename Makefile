BASH=$$(which bash)

all: 
	${BASH} install.sh

uninstall:
	/bin/rm -rf /bin/auto_sysupdate
	/bin/rm -rf /root/.scripts/.au.conf
	/bin/rm -rf /root/.scripts/sysupdate.sh
	/bin/rm -rf /var/log/auto_sysupdate.log 
	/bin/rm -rf /var/log/auto_sysupdate.error.log 
	crontab -l | grep -v '/bin/auto_sysupdate'  | crontab -
