#!/bin/bash

chmod +x script.sh

echo "Начало теста Поиск победителя"

# Проверка файла с входными двнными
if [[ -f winTestData.txt ]]
then
    echo ` cat winTestData.txt ` > board.txt
    echo "Поле обновлено"
else
    echo "Нет данных для теста"
fi

# Запуск Игры
if [[ -f script.sh ]]
then
    echo "Игра запущена"
    result=$(./script.sh)
    result=`cat chempione.txt`
    if [[ $result == "Игрок Х выиграл!" ]]
    then
        echo "Тест пройден успешно"
    else 
        echo "Тест провален"
    fi
else
    echo "Нет тестируемого файла"
fi

echo "_ _ _ _ _ _ _ _ _" > board.txt
echo "Конец теста" 