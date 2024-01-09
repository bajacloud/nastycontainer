#!/bin/bash

# Type: Process
# Policy: Change password
# CredentialsAccess:Process/ContainerLocalUserPasswordModified

# Create a new user for testing (replace 'testuser' with your preferred username)
useradd -m testuser

# Change the password for the newly created user
echo "testuser:newpassword" | chpasswd


