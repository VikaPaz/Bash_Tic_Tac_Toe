#!/bin/bash

chmod +x winTest.sh
chmod +x errorTest.sh

# Тест проверки на победу
./winTest.sh
# Тест на не корректные значения
./errorTest.sh

