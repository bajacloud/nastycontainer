#!/bin/bash

# Type: Network
# Policy: Bad reputation IP / Domains
# A container is performing DNS lookups for bad reputation domains

# Fetch the most recent reported bad IPs. Take the top 10.
wget https://raw.githubusercontent.com/stamparm/ipsum/master/ipsum.txt
IP_LIST=($(awk '!/^#/ && NR>4 && NR<=14 {print $1}' ipsum.txt))

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
  
done