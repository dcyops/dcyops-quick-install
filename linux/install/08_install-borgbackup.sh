#!/usr/bin/env bash

apt-get install --no-install-recommends --no-install-suggests -y borgbackup || \
{ printf "\n[!] Error installing 'borgbackup'. Exiting...\n"; exit 1; }

mkdir -p /backup/.ssh
chmod 640 /backup
chmod g+s /backup

ssh-keygen -t ed25519 -f "/backup/.ssh/${HOSTNAME}"
cp -r ../config/borg/* /backup/

chmod 600 "/backup/.ssh/${HOSTNAME}"
chmod 640 "/backup/.ssh/${HOSTNAME}.pub"
chown -R root:root /backup

printf "192.168.1.71 belial belial" >> /etc/hosts

mkdir /var/log/borg 2>/dev/null
chown -R root:root /var/log/borg 2>/dev/null
chmod -R 640 /var/log/borg 2>/dev/null

printf "Install complete.\n"
printf "Don't forget to init a remote repo using 'borg init -e <type> borg@belial:/mnt/backups/borg/<repo_name>'\n"

