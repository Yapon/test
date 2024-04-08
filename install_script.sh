#!/bin/bash

# Установка git и переход в директорию пользователя
apt install git -y && cd /home/user/ && 

# Клонирование репозитория ChipiCoinGpuMiner
git clone https://github.com/ChipiCoin/ChipiCoinGpuMiner.git && cd ChipiCoinGpuMiner && 

# Установка curl
apt install curl -y && 

# Установка nvm и Node.js версии 16
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && source ~/.bashrc && nvm install 16 && 

# Скачивание и распаковка minertools
wget https://github.com/tontechio/pow-miner-gpu/releases/download/20211230.1/minertools-cuda-ubuntu-18.04-x86-64.tar.gz && tar -xzf minertools-cuda-ubuntu-18.04-x86-64.tar.gz && 

# Скачивание необходимых скриптов
wget -O /home/user/1.sh https://raw.githubusercontent.com/Yapon/test/master/123.sh &&
wget -O /home/user/run_chipi.sh https://raw.githubusercontent.com/Yapon/test/master/run_chipi.sh && 
wget -O /home/user/auto_chipi.sh https://raw.githubusercontent.com/Yapon/test/master/auto_chipi.sh && 

# Настройка прав доступа для скриптов
cd /home/user/ && chmod +x run_chipi.sh &&
cd /home/user/ && chmod +x 1.sh &&
cd /home/user/ && chmod +x auto_chipi.sh
