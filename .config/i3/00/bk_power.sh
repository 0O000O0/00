#!/usr/bin/env bash


# I3BLOCKS config,
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
  LABEL=':'
  LABEL_AC='⚡'
  LABEL_DC='#'
  COLOR_WHTE=${COLOR_WHTE:-#ffffff}
  COLOR_GRLT=${COLOR_GRLT:-#a0a0a0}
  COLOR_RRRR=${COLOR_RRRR:-#ff0000}
  COLOR_OOOO=${COLOR_OOOO:-#ff8000}
  COLOR_YYYY=${COLOR_YYYY:-#ffff00}
  COLOR_LLLL=${COLOR_LLLL:-#80ff00}
  COLOR_GGGG=${COLOR_GGGG:-#00ff00}
  AC="${BLOCK_INSTANCE:-AC0}"
  DC="${BLOCK_INSTANCE:-BAT0}"
  AC_ONLINE=$(cat /sys/class/power_supply/$AC/uevent \
    | grep 'POWER_SUPPLY_ONLINE=' \
    | grep -Eoe '[0-9]{1}' )
  DC_PRESENT=$(cat /sys/class/power_supply/$DC/uevent \
    | grep 'POWER_SUPPLY_PRESENT=' \
    | grep -Eoe '[0-9]{1}' )
  DC_STATUS=$(cat /sys/class/power_supply/$DC/uevent \
    | grep 'POWER_SUPPLY_STATUS=' \
    | grep -Eoe '=.+' )
  DC_CAPACITY=$(cat /sys/class/power_supply/$DC/uevent \
    | grep 'POWER_SUPPLY_CAPACITY=' \
    | grep -Eoe '[0-9]{2}|[0-9]{3}' )


function show_block {
  # no battery, should not be displayed
  #[[ ! -d /sys/class/power_supply/$INTERFACE/uevent ]] && exit
  if (( ( ! $AC_ONLINE ) &&  ( ! $DC_PRESENT ) )); then
    LABEL=''
  fi
  if (( ! $AC_ONLINE )); then
    LABEL_AC=''
  fi
  if (( ! $DC_PRESENT )); then
    LABEL_DC=''
  fi
  BLOCK="$LABEL_AC$LABEL_DC$LABEL$DC_CAPACITY"
  echo $BLOCK
  echo $BLOCK
}

function show_color {
  if   (( $DC_CAPACITY == 100 )); then
    echo $COLOR_WHTE
  elif (( $DC_CAPACITY >= 80 )); then
    echo $COLOR_GGGG
  elif (( $DC_CAPACITY >= 60 )); then
    echo $COLOR_LLLL
  elif (( $DC_CAPACITY >= 40 )); then
    echo $COLOR_YYYY
  elif (( $DC_CAPACITY >= 20 )); then
    echo $COLOR_OOOO
  else
    echo $COLOR_RRRR
  fi
}


show_block
show_color


