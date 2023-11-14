#!/bin/bash

# Scenario 2: Compiler Executed In Container
timeout 5s /app/scenarios/compiler_executed.sh

# Scenario 3: 
timeout 5s /app/scenarios/container_management_utility.sh

# Scenario 4: Modify User Password (Ubuntu)
timeout 5s /app/scenarios/modify_user_password.sh

# Scenario 5:
timeout 10s /app/scenarios/run_cryptominer.sh

# Scenario 6:
timeout 10s /app/scenarios/run_malware.sh

# Scenario 8: Container Management Utility in Container
timeout 10s /app/scenarios/simulate_port_scan.sh

# Scenario 8: Container Management Utility in Container
timeout 10s /app/scenarios/start_network_capture.sh

# Scenario 1: 
timeout 10s /app/scenarios/bad_reputation_ip.sh

# Sleep for a while to allow scenarios to run
sleep 3600  # Adjust the duration as needed


