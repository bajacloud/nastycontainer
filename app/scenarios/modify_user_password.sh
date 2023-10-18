#!/bin/bash

# Simulate modification of a local user's password
# Replace "user_to_modify" with the actual username you want to target
echo "ubuntu:new_password" | chpasswd

# Sleep for a while to give the security agent time to detect the password change
sleep 30
