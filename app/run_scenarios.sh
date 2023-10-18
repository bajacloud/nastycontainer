#!/bin/bash

# Start network capture in the background
/app/scenarios/start_network_capture.sh &

# Run the remaining scenarios sequentially

# Scenario 6: Network Anomalies
/app/scenarios/simulate_port_scan.sh &

# Scenario 16: Suspicious Process Activity
/app/scenarios/simulate_suspicious_process.sh &

# Scenario 19: Modify User Password (Ubuntu)
/app/scenarios/modify_user_password.sh ubuntu &

# Scenario 22: Clear Shell Command History
/app/scenarios/simulate_history_cleanup.sh &

# Scenario 23: Delete Shell Command History File
/app/scenarios/simulate_history_file_deletion.sh &

# Sleep for a while to allow scenarios to run
sleep 3600  # Adjust the duration as needed

