#!/bin/sh

if [ -x /bin/systemctl ]; then
    /bin/systemctl daemon-reload
    /bin/systemctl start zfs-snapshots-collector.timer
fi
