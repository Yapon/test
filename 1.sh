#!/bin/bash

# Function to stop all processes in screen sessions with names "chipi" and "auto_miner"
stop_screen_processes() {
    screen -ls | grep -E '\<chipi\>|\<auto_miner\>' | while read -r session_info; do
        session_name=$(echo "$session_info" | awk '{print $1}')
        session_status=$(echo "$session_info" | awk '{print $3}')
        
        if [[ $session_status == "(Dead" ]]; then
            screen -S "$session_name" -X quit
        else
            screen -S "$session_name" -X stuff "^C"
            sleep 5
            if screen -list | grep "$session_name" >/dev/null; then
                screen -S "$session_name" -X kill
            fi
        fi
    done
}

# Stop all processes in screen sessions
stop_screen_processes

# Wait for a brief moment
sleep 1

# Change to the user directory and start the auto_chipi.sh script in a new screen session named "auto_miner"
cd /home/user/ && screen -dmS auto_miner ./auto_chipi.sh
