#!/bin/bash

# Path to your run_chipi.sh script
RUN_CHIP_SCRIPT="/home/user/run_chipi.sh"

# Minimum power consumption threshold for running the script (in watts)
MIN_POWER_THRESHOLD=80

# Function to get the current power consumption
get_power_consumption() {
    # Your code to get power consumption, for example using nvidia-smi
    power=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits)
    echo "$power"
}

# Main script loop
while true; do
    # Get current power consumption
    power=$(get_power_consumption)
    
    # Compare with minimum threshold
    if (( $(echo "$power < $MIN_POWER_THRESHOLD" | bc -l) )); then
        echo "Power consumption is less than $MIN_POWER_THRESHOLD W. Running the script."
        # Run the script
        "$RUN_CHIP_SCRIPT"
    else
        echo "Power consumption is equal to or greater than $MIN_POWER_THRESHOLD W. Waiting..."
    fi
    
    # Pause for 5 minutes before checking again
    sleep 300
done