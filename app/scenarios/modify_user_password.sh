#!/bin/bash

# Create a new user for testing (replace 'testuser' with your preferred username)
useradd -m testuser

# Change the password for the newly created user
echo "testuser:newpassword" | chpasswd

# Validation: Log successful scenario execution
echo "Scenario 19 (Modify User Password) executed successfully at $(date)" >> /var/log/scenario.log

