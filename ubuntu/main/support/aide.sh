#!/usr/bin/bash

apt install aide aide-common
aideinit
mv /var/lib/aide/aide.db.new /var/lib/aide/aide.db
prelink -ua
