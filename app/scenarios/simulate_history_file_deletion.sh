#!/bin/bash

# Simulate deleting the shell command history file
rm -f ~/.bash_history

# Sleep for a while to give the security agent time to detect the history file deletion
sleep 30
