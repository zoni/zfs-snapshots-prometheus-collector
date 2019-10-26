# zfs-snapshots-prometheus-collector

Prometheus textfile collector for ZFS snapshot statistics, exposing:

- `zfs_snapshots_total`: Number of snapshots per filesystem.
- `zfs_snapshots_oldest_seconds`: Age of oldest snapshot (per filesystem) since unix epoch in seconds.
- `zfs_snapshots_latest_seconds`: Age of latest snapshot (per filesystem) since unix epoch in seconds.
- `zfs_snapshots_time_spent_getting_snapshots_seconds`: Time spent waiting for `zfs list` to return snapshots.
- `zfs_snapshots_last_update_timestamp_seconds`: Time of last update in seconds since unix epoch.

## Installation

Ubuntu/Debian users can run `./package.sh` to build a Debian package to install.
The included systemd service files will run this approximately every 15 seconds by default.

Requires Python 3.6+ and assumes [node_exporter] is running and configured with `--collector.textfile.directory /var/tmp/node-exporter`.

## Configuration

The first argument to the script determines the filesystem root to scan and defaults to `storage`.
To adjust, run `systemctl edit zfs-snapshots-collector.service` and add:

```
[Service]
ExecStart=
ExecStart=/usr/bin/zfs-snapshots-collector YOUR_FILESYSTEM_ROOT
```

[node_exporter]: https://github.com/prometheus/node_exporter
