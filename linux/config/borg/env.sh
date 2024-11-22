#!/usr/bin/env bash

export BORG_REPO='borg@belial:/mnt/backups/borg/<repo_name>'
export BORG_BASE_DIR=/backup
export BORG_PASSPHRASE=""
export BORG_RSH='ssh -i /backup/.ssh/<repo_name>'
