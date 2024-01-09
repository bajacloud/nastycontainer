#!/bin/bash

# Type: Process
# Policy: AWS credentials access
# Execution:Process/AWSCredentials

timeout_duration=20
command_to_run="fgrep .aws/credentials"
timeout $timeout_duration $command_to_run