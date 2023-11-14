#!/bin/bash

# Scenario 2: Compiler Executed In Container
/app/scenarios/compiler_executed.sh
sleep 5

# Scenario 3: 
/app/scenarios/container_management_utility.sh
sleep 5

# Scenario 4: Modify User Password (Ubuntu)
/app/scenarios/modify_user_password.sh
sleep 5

# Scenario 5:
/app/scenarios/run_cryptominer.sh
sleep 10

# Scenario 6:
/app/scenarios/run_malware.sh
sleep 10

# Scenario 8: Container Management Utility in Container
/app/scenarios/simulate_port_scan.sh
sleep 10

# Scenario 8: Container Management Utility in Container
/app/scenarios/start_network_capture.sh
sleep 10
# Scenario 1: 
/app/scenarios/bad_reputation_ip.sh

# Sleep for a while to allow scenarios to run
sleep 3600  # Adjust the duration as needed

