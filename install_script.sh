#!/bin/bash

# Function to execute a command with a delay of 2 seconds
execute_with_delay() {
    sleep 2
    echo "Executing command: $@"
    eval "$@"
}

# Install git
execute_with_delay "apt install git"

# Change directory to /home/user/ and clone ChipiCoinGpuMiner repository
execute_with_delay "cd /home/user/ && git clone https://github.com/ChipiCoin/ChipiCoinGpuMiner.git && cd ChipiCoinGpuMiner"

# Install curl and NVM
execute_with_delay "apt install curl -y"
execute_with_delay "curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash"
execute_with_delay "source ~/.bashrc && nvm install 16"

# Download and extract minertools-cuda
execute_with_delay "wget https://github.com/tontechio/pow-miner-gpu/releases/download/20211230.1/minertools-cuda-ubuntu-18.04-x86-64.tar.gz && tar -xzf minertools-cuda-ubuntu-18.04-x86-64.tar.gz"

# Download scripts
execute_with_delay "wget -O /home/user/1.sh https://raw.githubusercontent.com/Yapon/test/master/123"
execute_with_delay "wget -O /home/user/run_chipi.sh https://raw.githubusercontent.com/Yapon/test/master/run_chipi.sh"
execute_with_delay "wget -O /home/user/auto_chipi.sh https://raw.githubusercontent.com/Yapon/test/master/auto_chipi.sh"

# Set permissions for scripts
execute_with_delay "cd /home/user/ && chmod +x run_chipi.sh"
execute_with_delay "cd /home/user/ && chmod +x auto_chipi.sh"
execute_with_delay "cd /home/user/ && chmod +x 1.sh"
