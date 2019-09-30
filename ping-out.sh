#!/bin/bash
#
# Every 60 seconds, ping 8.8.8.8
# and, when an error occurs, write the results into a file.
#
# author: andreasl

# Ping command line options:
#   -c: stop after c answered packages
#   -i: seconds wait interval
#   -q quiet
#   -w: seconds overall deadline

prefix_path='/home/barn/logs/'

mkdir -p "$prefix_path"

while sleep 60; do
    ping_output="$(ping -c 10 -i 1 -q -w 10 8.8.8.8 2>/dev/null)"
    ping_exit_code="$?"

    if [ "$ping_exit_code" -ne 0 ]; then
        ping_results="$(grep 'packets transmitted.*received.*packet loss.*time' <<< "$ping_output")"
        now="$(date '+%s') $(date)"
        ping_log_file="${prefix_path}/ping-stats-$(date +%Y).log"
        printf "%s %s %s\n" "$now" "$ping_exit_code" "$ping_results" >> "$ping_log_file"
    fi
done
