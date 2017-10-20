#!/bin/sh
# Drop-in replacement for old forking start_rtkbt.sh

rtkbt.sh "$@" >/var/log/hciattach.log 2>&1 &

