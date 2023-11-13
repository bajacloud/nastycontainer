#!/bin/bash

# Scenario 2: Compiler Executed In Container
/app/scenarios/compiler_executed.sh

# Scenario 3: 
/app/scenarios/container_management_utility.sh

# Scenario 4: Modify User Password (Ubuntu)
/app/scenarios/modify_user_password.sh

# Scenario 5:
/app/scenarios/run_cryptominer.sh

# Scenario 6:
/app/scenarios/run_malware.sh

# Scenario 6: Delete Shell Command History File
/app/scenarios/simulate_history_cleanup.sh

# Scenario 7: Compiler Executed In Container
/app/scenarios/simulate_history_file_deletion.sh

# Scenario 8: Container Management Utility in Container
/app/scenarios/simulate_port_scan.sh

# Scenario 8: Container Management Utility in Container
/app/scenarios/simulate_suspicious_process.sh

# Scenario 8: Container Management Utility in Container
/app/scenarios/start_network_capture.sh

# Scenario 1: 
/app/scenarios/bad_reputation_ip.sh

# Sleep for a while to allow scenarios to run
sleep 3600  # Adjust the duration as needed

