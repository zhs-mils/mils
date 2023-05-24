#!/bin/bash

# GITHUB

# ИНТЕРФЕЙС




function header() {
  clear
  echo ""
  echo "🇲 🇮 🇱 🇸  | 🇸 🇪 🇹 🇺 🇵"
  echo "-> v: 0.1 - d: 24.05.2023"
  echo ""
}


# Очищаем содержимое экрана.
clear

# Отображаем шапку.
header

# Проверяем, существует ли файл с лицензией.
if [ -f .license_key ]; then
    license_key=$(sed -n '1p' .license_key)
else
    echo "ОШИБКА: Файл с лицензией не обнаружен!"
    exit
fi


setup_exit=0
while [ $setup_exit -le 1 ]; do
    header

    echo "(1) - Установить как основное приложение."
    echo "(2) - Установить как Воркер."
    echo "(3) - Обновить инсталлятор."
    echo "(4) - Обновить контейнеры."
    echo "(5) - Обновить структуру."
    echo "(0) - Exit"

    echo ""
    echo "Enter: "
    read user_input

    if [ $user_input == "1" ]; then
        echo "Запускаю установку..."
        git clone https://mrutsy:$license_key@github.com/zhs-mils/containers.git
        git clone https://mrutsy:$license_key@github.com/zhs-mils/structure.git
        echo "Приложение установлено."
        sleep 2
    elif [ $user_input == "2" ]; then
        echo $user_input
        sleep 1
    elif [ $user_input == "3" ]; then
        echo "Запускаю процесс обновления инсталлятора."
        git pull
        echo "Инсталлятор обновлен. Перезапустите скрипт!"
        sleep 2
        exit
    elif [ $user_input == "4" ]; then
      echo "Обновляю контейнеры."
      cd containers && git pull && cd ../
      echo "Обновлены."
      sleep 2
    elif [ $user_input == "5" ]; then
      echo "Обновляю структуру."
      cd structure && git pull && cd ../
      echo "Обновлено."
      sleep 2
    elif [ $user_input == "0" ]; then
        exit
    fi
done