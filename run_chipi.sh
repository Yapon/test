#!/bin/bash

sleep 1
cd /home/user/ChipiCoinGpuMiner
# Wait for 1 seconds
sleep 2
# Display message: Entering ChipiCoinGpuMiner directory
echo "Entering ChipiCoinGpuMiner directory"
# Install Node.js version 16
nvm install 16
# Wait for 5 seconds
sleep 5
# Display message: Installing Node.js version 16
echo "Installing Node.js version 16"
# Start Chipi
screen -dmS chipi ./start_multi_8.sh
# Wait for 5 seconds
sleep 5
# Display message: Chipi started
echo "Chipi started"

