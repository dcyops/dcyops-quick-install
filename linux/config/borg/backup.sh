#!/usr/bin/env bash

source /backup/env.sh

borg create "$@"                            \
    --stats                                 \
    --one-file-system                       \
    --compression auto,zstd,3               \
    --exclude /backup                       \
    --exclude /root/.cache                  \
    --exclude /home/**/.cache               \
    --exclude /home/user/snap/firefox       \
    --exclude /dev                          \
    --exclude /proc                         \
    --exclude /sys                          \
    --exclude /tmp                          \
    --exclude /run                          \
    "$BORG_REPO::{hostname}-{now:%Y-%m-%d}" \
    / >> /var/log/borg/backup-"$(date +'%Y-%m-%d').log"
