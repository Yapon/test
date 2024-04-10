#!/bin/bash
sleep 1
# Остановка всех процессов в screen с названием "chipi" и "auto_miner"
screen -ls | grep -E '\<chipi\>|\<auto_miner\>' | cut -d. -f1 | awk '{print $1}' | xargs -I {} screen -X -S {} quit
sleep 1
# Переход в директорию пользователя и запуск скрипта auto_chipi.sh в новом screen-сеансе с названием "auto_miner"
cd /home/user/ && screen -dmS auto_miner ./auto_chipi.sh
