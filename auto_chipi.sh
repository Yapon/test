#!/bin/bash

# Function to get the total power consumption of all Nvidia GPUs
get_total_power() {
    nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits | awk '{ sum += $1 } END { print sum }'
}

# Threshold value for power consumption (in Watts) at which to execute the command
threshold=100

# Infinite loop for polling every 5 minutes
while true; do
    # Check the current total power consumption of GPUs
    total_power=$(get_total_power)

    # If the consumption is below the threshold, execute the command
    if [ $(echo "$total_power < $threshold" | bc) -eq 1 ]; then
        echo "Total power consumption is below $threshold Watts. Executing the command."
        cd /home/user && ./run_chipi.sh
    else
        echo "Total power consumption is $total_power Watts, which is greater than or equal to $threshold Watts."
    fi

    # Wait for 5 minutes before the next iteration
    sleep 300
done
