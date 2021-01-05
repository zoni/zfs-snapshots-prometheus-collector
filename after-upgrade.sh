if [ -x /bin/systemctl ]; then
    /bin/systemctl daemon-reload
    /bin/systemctl restart zfs-snapshots-collector.timer
fi
