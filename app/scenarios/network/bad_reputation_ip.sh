#!/bin/bash

# Type: Network
# Policy: Paste Services DNS
# A container is performing DNS lookups for paste service

# List of IP addresses to ping
IP_LIST=("170.64.210.160"
"170.64.210.205"
"170.64.210.207"
"170.64.210.165"
"222.186.16.214"
"170.64.133.232"
"211.253.10.96"
"162.142.125.220"
"82.200.65.218"
"110.45.145.194"
"1.214.214.114"
"200.76.53.187"
"150.95.64.109"
"43.155.141.65"
"66.98.112.247"
"210.87.195.112"
"165.154.236.136"
"113.200.60.74"
"101.36.107.47"
"186.209.77.237"
"167.248.133.36")

# Number of times to repeat the list
NUM_REPEATS=1

# Loop for the defined number of repeats
for ((repeat=1; repeat <= NUM_REPEATS; repeat++)); do

  # Loop over each IP address and ping
  for ip in "${IP_LIST[@]}"; do
    echo "Pinging $ip..."
    if ping -c 4 "$ip" >/dev/null 2>&1; then
      echo "$ip is reachable."
    else
      echo "$ip is unreachable."
    fi
  done
  
  # Wait for 120 seconds before the next repeat
  echo "Waiting for 120 seconds..."
  sleep 120
done