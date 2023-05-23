#!/bin/bash

chmod +x script.sh

echo "Начало теста Поиск некорректные данные"

# Проверка файла с входными двнными
if [[ -f errorTestData.txt ]]
then
    echo "Поле обновлено"
else
    echo "Нет данных для теста"
fi

# Запуск Игры
if [[ -f script.sh ]]
then
    echo "Игра запущена"
    for move in ` cat errorTestData.txt `
    do  
        result=$(echo "$move" | bash script.sh)
        result=`cat error.txt`
        if [[ $result == "error message" ]]
        then
            echo "Тест пройден успешно, для значения $move"
        else 
            echo "Тест провален"
        fi
        echo "_ _ _ _ _ _ _ _ _" > error.txt
    done
else
    echo "Нет тестируемого файла"
fi

echo "Конец теста" 