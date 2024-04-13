#!/bin/bash

# Function to get the total power consumption of all Nvidia GPUs
get_total_power() {
    nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits | awk '{ sum += $1 } END { print sum }'
}

# Threshold value for power consumption (in Watts) at which to execute the command
threshold=65
# Threshold for the duration of low power consumption (in seconds) to execute the command
duration_threshold=$((5 * 60))

# Variable to track the duration of low power consumption
low_power_duration=0

# Infinite loop for polling every 5 minutes
while true; do
    # Check the current total power consumption of GPUs
    total_power=$(get_total_power)

    # If the consumption is below the threshold, increment the low power duration counter
    if [ $(echo "$total_power < $threshold" | bc) -eq 1 ]; then
        low_power_duration=$((low_power_duration + 300))
    else
        # If consumption is above threshold, reset the low power duration counter
        low_power_duration=0
    fi

    # If low power duration exceeds the threshold, execute the command
    if [ $low_power_duration -ge $duration_threshold ]; then
        echo "Total power consumption has been below $threshold Watts for more than 5 minutes. Executing the command."
        cd /home/user
        sleep 1
        ./run_chipi.sh
        sleep 1
        # Reset the low power duration counter after executing the command
        low_power_duration=0
    fi

    # Wait for 2 minutes before the next iteration
    sleep 120
done
