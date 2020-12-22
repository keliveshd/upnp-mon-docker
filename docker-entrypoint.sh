#!/bin/bash
if [ ! -f "/upnp-mon/config/upnp-mon.conf" ]; then
	cp /upnp-mon/upnp-mon.conf /upnp-mon/config/upnp-mon.conf
fi

if [ ! -f "/upnp-mon/config/upnp-mon.rules.conf" ]; then
	cp /upnp-mon/upnp-mon.rules /upnp-mon/config/upnp-mon.rules.conf
fi

if [ ! -f "/upnp-mon/config/cron.conf" ]; then
#	echo '*  *  *  *  *    bash /upnp-mon/upnp-mon>/upnp-mon/config/connect.log 2>&1' > /upnp-mon/config/cron.conf
	echo '0 0/5 *  *  *    bash /upnp-mon/upnp-mon>/upnp-mon/config/connect.log 2>&1' > /upnp-mon/config/cron.conf
fi

cp /upnp-mon/config/cron.conf /etc/crontabs/root
touch /upnp-mon/config/connect.log
cat /etc/crontabs/root>>/upnp-mon/config/connect.log
crond
exec "$@"
