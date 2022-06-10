#!/usr/bin/env bash


# I3 config, keymap
  # Copyright (C) 2021 Jessie Chan
  #
  # This program is free software: you can redistribute it
  # and/or modify it under the terms of the GNU General Public License
  # as published by the Free Software Foundation,
  # either version 3 of the License, or any later version.
  #
  # You should have received a copy of the GNU General Public License
  # along with this program.
  # If not, see <http://www.gnu.org/licenses/>.


# init var
  MNTR_00='eDP'
  MNTR_ALL=$( xrandr | grep ' connected' \
    | awk '{print $1}' )
  MNTR_ACT=$( xrandr --listactivemonitors | grep ' +' \
    | awk '{print $NF}' )
  COUNT=$( xrandr | grep -c ' connected' )
  INDEX=0


function press_key {
  # return if only one monitor
  if (( COUNT == 1 )); then
    return
  fi
  # get next monitor index
  MNTRS=("$MNTR_ALL" $MNTR_ALL)
  NUM=${#MNTRS[@]}
  for j in `seq $NUM`
  do
    i=$(($j-1))
    if [[ ${MNTRS[$i]} = $MNTR_ACT ]]; then
      INDEX=$j
      break
    fi
  done
  # output monitor all extend
  if [[ $INDEX -ge $NUM ]]; then
    for j in `seq $COUNT`
    do
      if (( j == 1 )); then
        xrandr --auto --output ${MNTRS[$j]}
      else
        xrandr --auto --output ${MNTRS[$j]} --above ${MNTRS[1]} --scale 1
        #echo xrandr --auto --output ${MNTRS[$j]} --same-as ${MNTRS[1]} --scale 0.75
      fi
    done
    PTH='/home/oo/.config/alacritty/window.yml'
    sed -i -r 's#(size: ).*#\110#g' "$PTH"
  # output monitor one by one
  else
    for j in `seq $COUNT`
    do
      echo ${MNTRS[$j]}
      if (( $j == $INDEX )); then
        xrandr --output ${MNTRS[$j]} --auto --scale 1
          PTH='/home/oo/.config/alacritty/window.yml'
          RES=$( xrandr | grep "${MNTRS[$j]}" \
            | grep -Eoe '[0-9]+x' | cut -f1 -d 'x' )
          if   [[ $RES -lt 1920 ]]; then
            sed -i -r 's#(size: ).*#\108#g' "$PTH"
          elif (( $RES == 1920 )); then
            sed -i -r 's#(size: ).*#\110#g' "$PTH"
          elif (( $RES == 2560 )); then
            sed -i -r 's#(size: ).*#\120#g' "$PTH"
          fi
      else
        xrandr --output ${MNTRS[$j]} --off
      fi
    done
  # output monitor
  fi
}


press_key


