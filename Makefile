BASH=$$(which bash)

all: 
	${BASH} install.sh

uninstall:
	/bin/rm -rf /root/.scripts/.au.conf
	/bin/rm -rf /etc/cron.weekly/sysupdate
	/bin/rm -rf /var/log/auto_sysupdate.log 
	/bin/rm -rf /var/log/auto_sysupdate.error.log 
