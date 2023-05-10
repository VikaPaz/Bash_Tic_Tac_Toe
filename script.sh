#!/bin/bash
export LANG=C.UTF-8

board=(" " " " " " " " " " " " " " " " " ")
player="X"

function display_board {
  clear
  echo " ${board[0]} | ${board[1]} | ${board[2]} "
  echo "---+---+---"
  echo " ${board[3]} | ${board[4]} | ${board[5]} "
  echo "---+---+---"
  echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

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
    display_board
    echo "Игрок $1 плбедил!"
    exit
  fi
}

while true; do
  display_board
  read -p "Игрок $player, выбери клетку (1-9): " pos
  if [[ $pos -ge 1  &&  $pos -le 9 ]]
  then
      if [[ ${board[$pos-1]} == " " ]] 
      then
        board[$pos-1]=$player
        check_win $player
        if [[ $player == "X" ]] 
        then
          player="O"
        else
          player="X"
        fi
      else
        echo "Эта клетка уже занята, попробуй снова"
        sleep 1
      fi
  else
      echo "Такой клетки не существует"
      sleep 1
  fi
done
