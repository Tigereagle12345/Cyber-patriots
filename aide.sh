#!/usr/bin/bash

apt install aide aide-common
aideinit
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
prelink -ua

(cat /etc/systemd/system/aidecheck.service ; echo " [Unit] 
Description=Aide check every day at 5AM

 [Timer] 
OnCalendar=*-*-* 05:00:00 Unit=aidecheck.service

 [Install] 
WantedBy=multi-user.target") > aide_conf
cp aide_conf /etc/systemd/system/aidecheck.service
rm aide_conf

chown root:root /etc/systemd/system/aidecheck.* 
chmod 0644 /etc/systemd/system/aidecheck.* 
systemctl daemon-reload 
systemctl enable aidecheck.service 
systemctl --now enable aidecheck.timer
