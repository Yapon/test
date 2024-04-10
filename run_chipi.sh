#!/bin/bash
# Install Node.js version 16
nvm install 16
# Wait for 5 seconds
sleep 5
# Display message: Installing Node.js version 16
echo "Installing Node.js version 16"
# Start Chipi
cd /home/user/ChipiCoinGpuMiner
# Wait for 5 seconds
sleep 5
# Display message: Entering ChipiCoinGpuMiner directory
echo "Entering ChipiCoinGpuMiner directory"
screen -dmS chipi ./start_multi_8.sh
# Wait for 5 seconds
sleep 5
# Display message: Chipi started
echo "Chipi started"

