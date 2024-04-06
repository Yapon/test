#!/bin/bash
# del name chipi
screen -ls | grep chipi | cut -d. -f1 | awk '{print $1}' | xargs kill
#
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && source ~/.bashrc && nvm install 16
# start chipi
cd /home/user/ChipiCoinGpuMiner && screen -dmS chipi ./start_multi_8.sh