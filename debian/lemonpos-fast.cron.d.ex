#
# Regular cron jobs for the lemonpos-fast package
#
0 4	* * *	root	[ -x /usr/bin/lemonpos-fast_maintenance ] && /usr/bin/lemonpos-fast_maintenance
