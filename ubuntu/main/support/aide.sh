#!/usr/bin/bash

apt install aide aide-common
aideinit
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
prelink -ua

echo -e "0 5 * * * /usr/bin/aide.wrapper --config /etc/aide/aide.conf --check" || crontab -u root -e
