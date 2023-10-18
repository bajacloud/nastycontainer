#!/bin/bash

# Simulate a port scan using nmap
nmap -p 1-100 localhost

# Sleep for a while to give the security agent time to detect the port scan
sleep 30
