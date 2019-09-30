#!/bin/bash
#
# Setup a systemd service that can run the script ping-out.sh
#
# author: andreasl
set -e

sudo cp -v 'ping-out.service' '/lib/systemd/system'

# prepare copied ping-out.service to point to the right script path
sudo sed -i \
    "s/ExecStart=.*$/ExecStart=\/bin\/bash ${PWD//\//\\\/}\/ping-out.sh/g" \
    '/lib/systemd/system/ping-out.service'

printf 'systemd service ping-out installed.\n'
