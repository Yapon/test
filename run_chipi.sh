#!/bin/bash
# del name chipi
screen -ls | grep chipi | cut -d. -f1 | awk '{print $1}' | xargs kill
# start chipi
cd /home/user/ChipiCoinGpuMiner
cd /home/user/ChipiCoinGpuMiner && screen -dmS chipi ./start_multi_8.sh
