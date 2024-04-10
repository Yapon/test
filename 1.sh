#!/bin/bash

# Stop all processes in screen with names "chipi" and "auto_miner"
screen -ls | grep -E '\<chipi\>|\<auto_miner\>' | awk -F '[.]' '/^[[:space:]]*[[:digit:]]/{print $1}' | xargs -I {} screen -S {} -X quit
# Wait for 3 seconds
sleep 3
# Display message: Stopping all processes in screen with names "chipi" and "auto_miner"
echo "Stopping all processes in screen with names 'chipi' and 'auto_miner'"

# Change directory to user's home directory
cd /home/user/
# Wait for 3 seconds
sleep 3
# Display message: Changing directory to user's home directory
echo "Changing directory to user's home directory"

# Start the auto_chipi.sh script in a new screen session named "auto_miner"
screen -dmS auto_miner ./auto_chipi.sh
# Wait for 3 seconds
sleep 3
# Display message: Starting auto_chipi.sh script in a new screen session named "auto_miner"
echo "Starting auto_chipi.sh script in a new screen session named 'auto_miner'"
