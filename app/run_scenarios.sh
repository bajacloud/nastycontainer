#!/bin/bash

# Scenario 1: Compiler Executed In Container
timeout 5s /app/scenarios/compiler_executed.sh

# Scenario 2: Container Management Utility (kubectl)
timeout 5s /app/scenarios/container_management_utility.sh

# Scenario 3: Modify User Password (Ubuntu)
timeout 5s /app/scenarios/modify_user_password.sh

# Scenario 4: Cryptominer
timeout 10s /app/scenarios/run_cryptominer.sh

# Scenario 5: Malware
timeout 10s /app/scenarios/run_malware.sh

# Scenario 6: Port Scan
timeout 10s /app/scenarios/simulate_port_scan.sh

# Scenario 7: Network Capture
timeout 10s /app/scenarios/start_network_capture.sh

# Scenario 8: Bad Reputation IPs
timeout 10s /app/scenarios/bad_reputation_ip.sh

# Scenario 9: Reverse shell
/app/scenarios/reverse_shell.sh

# Sleep for a while to allow scenarios to 
sleep 3600  # Adjust the duration as needed


