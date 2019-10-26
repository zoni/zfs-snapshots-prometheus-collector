#!/usr/bin/env bash

set -xeuo pipefail

umask 022

rm -rf .build && mkdir -p .build/usr/bin .build/usr/lib/systemd/system
cp zfs-snapshots-collector .build/usr/bin
cp zfs-snapshots-collector.service zfs-snapshots-collector.timer .build/usr/lib/systemd/system

fpm -t deb -s dir -C .build -f \
    --after-install after-install.sh \
    --after-upgrade after-upgrade.sh \
    --architecture "all" \
    --before-remove before-remove.sh \
    --deb-compression xz \
    --description "Prometheus textfile collector for ZFS snapshots" \
    --maintainer "Nick Groenen <nick@groenen.me>" \
    --name zfs-snapshots-prometheus-collector \
    --url "https://github.com/zoni/zfs-snapshots-prometheus-collector/" \
    --version "$(date +%Y%m%d.%H%M)" \
    .
