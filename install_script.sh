#!/bin/bash

# Установка Git
apt install git -y

# Клонирование репозитория
cd /home/user/ && git clone https://github.com/ChipiCoin/ChipiCoinGpuMiner.git

# Установка curl
apt install curl -y

# Установка Node Version Manager (NVM)
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
source ~/.bashrc
nvm install 16

# Загрузка и распаковка POW Miner
wget https://github.com/tontechio/pow-miner-gpu/releases/download/20211230.1/minertools-cuda-ubuntu-18.04-x86-64.tar.gz
tar -xzf minertools-cuda-ubuntu-18.04-x86-64.tar.gz

# Скачивание и установка скриптов
wget -O /home/user/run_chipi.sh https://raw.githubusercontent.com/Yapon/test/master/run_chipi.sh
wget -O /home/user/auto_chipi.sh https://raw.githubusercontent.com/Yapon/test/master/auto_chipi.sh
chmod +x /home/user/run_chipi.sh
chmod +x /home/user/auto_chipi.sh

# Создание пустого файла config.txt
touch /home/user/config.txt
