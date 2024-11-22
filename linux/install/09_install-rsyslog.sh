#!/usr/bin/env bash

apt-get install --no-install-recommends --no-install-suggests -y rsyslog || \
{ printf "\n[!] Error installing 'rsyslog'. Exiting...\n"; exit 1; }

cat << 'EOF' | sudo tee /etc/rsyslog.d/10-logpattern.conf > /dev/null
$template logpattern,"[%$year%-%$month%-%$day%@%timegenerated:12:19:date-rfc3339%] %HOSTNAME% %syslogseverity-text:0:3:uppercase% %msg%\n"
$ActionFileDefaultTemplate logpattern
EOF

sudo systemctl restart rsyslog
