#!/bin/bash
#
# Setup a systemd service that can run the script ping-out.sh.
#
# author: andreasl
set -e

if ! command -v systemd >/dev/null; then
    printf 'Error: systemd not found.\n'
    exit 1
fi

sudo cp -v 'ping-out.sh' '/usr/local/bin'
sudo cp -v 'ping-out.service' '/lib/systemd/system'

printf 'systemd service ping-out installed.\n'

printf 'Running\n   systemctl status ping-out...\n'
sudo systemctl status ping-out
