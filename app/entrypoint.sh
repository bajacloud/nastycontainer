#!/bin/bash

if [ "$1" = "-s" ]; then
    # Enter sleep mode
    echo "(In sleep/silent mode...)"
    sleep 604800
elif [ -t 0 ] ; then
    # Enter menu mode
    echo "(starting interactive shell)"
    # Start menu
    /app/run_scenarios.sh
else
    echo "(starting non-interactive shell)"
    # Start automatic run
    /app/auto.sh
fi
