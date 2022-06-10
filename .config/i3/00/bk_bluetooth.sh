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
  LABEL='BT'
  COLOR_WHTE=${COLOR_WHTE:-#ffffff}
  COLOR_GRLT=${COLOR_GRLT:-#a0a0a0}
  COLOR_RRRR=${COLOR_RRRR:-#ff0000}
  COLOR_LLLL=${COLOR_LLLL:-#80ff00}
  COLOR_AAAA=${COLOR_AAAA:-#0080ff}
  INTERFACE="${BLOCK_INSTANCE:-hci0}"
  BLOCK=$( rfkill | grep 'bluetooth' \
    | grep -Eoe 'blocked$|unblocked$' )
  POWER=$( bluetoothctl show | grep 'Powered:' \
    | cut -f2 -d ' ' )
  MAC=$( hcitool con | grep -A 5 'Connections:' \
    | grep -Eoe '..:..:..:..:..:..' )
  NAME=$( bluetoothctl info $MAC | grep 'Name:' \
    | cut -f2 -d ':' | cut -c 2- )
  #STATE=$( bluetoothctl info $MAC | grep 'Connected:' \
  #  | cut -f2 -d ' ' )
  PAIRED=$( bluetoothctl info $MAC | grep 'Paired:' \
    | cut -f2 -d ' ' )
  CONNECTED=$( bluetoothctl info $MAC | grep 'Connected:' \
    | cut -f2 -d ' ' )


function show_block {
  if [[ "$BLOCK" != 'unblocked' ]]; then
    LABEL=""
  fi
  BLOCK="$LABEL"
  echo $BLOCK
  echo $BLOCK
}

function show_color {
  if   [[ "$POWER" != 'yes' ]]; then
    echo $COLOR_GRLT
  elif [[ "$POWER" == 'yes' ]]; then
    if   [[ "$PAIRED" != 'yes' ]] && [[ "$CONNECTED" != 'yes' ]]; then
      echo $COLOR_WHTE
    elif [[ "$PAIRED" != 'yes' ]] && [[ "$CONNECTED" == 'yes' ]]; then
      echo $COLOR_RRRR
    elif [[ "$PAIRED" == 'yes' ]] && [[ "$CONNECTED" != 'yes' ]]; then
      echo $COLOR_LLLL
    elif [[ "$PAIRED" == 'yes' ]] && [[ "$CONNECTED" == 'yes' ]]; then
      echo $COLOR_AAAA
    fi
  fi
}


show_block
show_color


