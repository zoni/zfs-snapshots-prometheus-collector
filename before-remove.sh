#!/bin/sh

if [ -x /bin/systemctl ]; then
    /bin/systemctl daemon-reload
    /bin/systemctl stop zfs-snapshots-collector.timer
    /bin/systemctl stop zfs-snapshots-collector.service
fi
