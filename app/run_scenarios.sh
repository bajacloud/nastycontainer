#!/bin/bash

# Enable error handling
set -e

# Scenario 1: 
/app/scenarios/bad_reputation_ip.sh || true

# Scenario 2: Compiler Executed In Container
/app/scenarios/compiler_executed.sh || true

# Scenario 3: 
/app/scenarios/container_management_utility.sh || true

# Scenario 4: Modify User Password (Ubuntu)
/app/scenarios/modify_user_password.sh || true

# Scenario 5:
/app/scenarios/run_cryptominer.sh || true

# Scenario 6:
/app/scenarios/run_malware.sh || true

# Scenario 7: Delete Shell Command History File
/app/scenarios/simulate_history_cleanup.sh || true

# Scenario 8: Simulate History File Deletion
/app/scenarios/simulate_history_file_deletion.sh || true

# Scenario 9: Simulate Port Scan
/app/scenarios/simulate_port_scan.sh || true

# Scenario 10: Simulate Suspicious Process Activity
/app/scenarios/simulate_suspicious_process.sh || true

# Scenario 11: Start Network Capture
/app/scenarios/start_network_capture.sh || true

# Disable error handling
set +e

# Sleep for a while to allow scenarios to run
sleep 3600  # Adjust the duration as needed
