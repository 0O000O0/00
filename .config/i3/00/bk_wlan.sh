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
  LABEL='WL'
  COLOR_WHTE=${COLOR_WHTE:-#ffffff}
  COLOR_GRLT=${COLOR_GRLT:-#a0a0a0}
  COLOR_RRRR=${COLOR_RRRR:-#ff0000}
  COLOR_OOOO=${COLOR_OOOO:-#ff8000}
  COLOR_YYYY=${COLOR_YYYY:-#ffff00}
  COLOR_LLLL=${COLOR_LLLL:-#80ff00}
  COLOR_GGGG=${COLOR_GGGG:-#00ff00}
  INTERFACE="${BLOCK_INSTANCE:-wlp1s0}"
  BLOCK=$( rfkill | grep 'wlan' \
    | grep -Eoe 'blocked$|unblocked$' )
  POWER=$( ip link | grep ${INTERFACE} \
    | grep -Eoe ',UP' | cut -f2 -d ',' )
  STATE=$( ip link | grep ${INTERFACE} \
    | grep -Eoe 'state .+ ' | cut -f2 -d ' ' )
  #STATE=$(cat /sys/class/net/$INTERFACE/operstate)
  SSID=$(iw "$INTERFACE" link | grep 'SSID' \
    | cut -f2 -d ':' | cut -c 2- )
  QUALITY=$(iw dev ${INTERFACE} link \
    | grep 'dBm$' | grep -Eoe '-[0-9]{2}' \
    | awk '{print ($1 > -50 ? 100 :($1 < -100 ? 0 : ($1+100)*2))}' )


function show_block {
  # no wireless, should not be displayed
  #[[ ! -d /sys/class/net/${INTERFACE}/uevent ]] && exit
  if [[ "$BLOCK" != 'unblocked' ]]; then
    LABEL=""
  elif [[ "$POWER" != 'UP' ]]; then
    LABEL="$LABEL"
  elif [[ "$STATE" =~ 'DOWN' ]]; then
    LABEL="$LABEL"
  else
    LABEL="$LABEL"
  fi
  BLOCK="$LABEL" # $SSID
  echo $BLOCK
  echo $BLOCK
}

function show_color {
  if [[ "$POWER" != 'UP' ]]; then
    echo $COLOR_GRLT
  elif [[ "$STATE" =~ 'DOWN' ]]; then
    echo $COLOR_WHTE
  elif [[ $QUALITY -ge 80 ]]; then
    echo $COLOR_GGGG
  elif [[ $QUALITY -ge 60 ]]; then
    echo $COLOR_LLLL
  elif [[ $QUALITY -ge 40 ]]; then
    echo $COLOR_YYYY
  elif [[ $QUALITY -ge 20 ]]; then
    echo $COLOR_OOOO
  else
    echo $COLOR_RRRR
  fi
}


show_block
show_color


