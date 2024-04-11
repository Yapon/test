#!/bin/bash

# Path to the file
FILE="/home/user/ChipiCoinGpuMiner/start_multi_8.sh"

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File $FILE does not exist."
    exit 1
fi

# Replace the value of the --givers parameter
sed -i 's/--givers 10000/--givers 1000/' "$FILE"

echo "The value of the --givers parameter has been successfully changed in the file $FILE."
