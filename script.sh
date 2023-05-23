#!/bin/bash

board=(` cat board.txt `)
player="Х"

#Отрисовка поля
function display_board {
  clear
  echo " ${board[0]} | ${board[1]} | ${board[2]} "
  echo "---+---+---"
  echo " ${board[3]} | ${board[4]} | ${board[5]} "
  echo "---+---+---"
  echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

#Проверка победы
function check_win {
  if [[ ${board[0]} == $1 && ${board[1]} == $1 && ${board[2]} == $1 ]] ||
     [[ ${board[3]} == $1 && ${board[4]} == $1 && ${board[5]} == $1 ]] ||
     [[ ${board[6]} == $1 && ${board[7]} == $1 && ${board[8]} == $1 ]] ||
     [[ ${board[0]} == $1 && ${board[3]} == $1 && ${board[6]} == $1 ]] ||
     [[ ${board[1]} == $1 && ${board[4]} == $1 && ${board[7]} == $1 ]] ||
     [[ ${board[2]} == $1 && ${board[5]} == $1 && ${board[8]} == $1 ]] ||
     [[ ${board[0]} == $1 && ${board[4]} == $1 && ${board[8]} == $1 ]] ||
     [[ ${board[2]} == $1 && ${board[4]} == $1 && ${board[6]} == $1 ]]
  then
    clear
    echo "Игрок $1 выиграл!"
    echo "Игрок $1 выиграл!" > chempione.txt
    echo "_ _ _ _ _ _ _ _ _" > board.txt
    exit
  fi
}

#Цикл игры
while true 
do
  display_board
  check_win $player
  read -p "Игрок $player, выбери клетку (1-9): " pos
  if [[ $pos -ge 1  &&  $pos -le 9 ]]
  then
      if [[ ${board[$pos-1]} == "_" ]] 
      then
        board[$pos-1]=$player
        check_win $player
        if [[ $player == "Х" ]] 
        then
          player="О"
        else
          player="Х"
        fi
      else
        echo "Эта клетка занята, попробуй ещё"
        sleep 1
      fi
  else
      echo "Такой клетки нет, попробуй ещё"
      echo "error message" > error.txt
      exit
  fi
done