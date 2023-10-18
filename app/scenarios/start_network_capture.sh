#!/bin/bash

# Start tcpdump to capture network traffic in the background
tcpdump -i any -w /app/network_capture.pcap
