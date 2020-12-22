#!/bin/bash
inotifywait -e close_write,moved_to,create -m ./config |
while read -r directory events filename; do
  if [ "$filename" = "upnp-mon.rules.conf" ]; then
     /upnp-mon/upnp-mon
  fi
done