if [ -x /bin/systemctl ]; then
    /bin/systemctl daemon-reload
    /bin/systemctl enable zfs-snapshots-collector.timer
    /bin/systemctl start zfs-snapshots-collector.timer
fi
