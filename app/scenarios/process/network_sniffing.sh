#!/bin/bash

# Type: Process
# Policy: Network sniffing
# Collection:Process/NetworkSniffing.NetworkSniffExecuted

# Start tcpdump to capture 10 packets and then stop.
tcpdump -i any -c 10
