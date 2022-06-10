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
  LABEL='U'
  PATH_ROOT="/boot/0000/"
  COLOR_WHTE=${COLOR_WHTE:-#ffffff}
  COLOR_GRLT=${COLOR_GRLT:-#a0a0a0}
  COLOR_RRRR=${COLOR_RRRR:-#ff0000}
  COLOR_OOOO=${COLOR_OOOO:-#ff8000}
  COLOR_YYYY=${COLOR_YYYY:-#ffff00}
  COLOR_LLLL=${COLOR_LLLL:-#80ff00}
  COLOR_GGGG=${COLOR_GGGG:-#00ff00}
  DISKs=$( lsblk | grep 'disk' \
    | grep -Eoe 'sd[a-z]' )
  PARTs=$( lsblk | grep 'part' \
    | grep -Eoe 'sd[a-z][1-9]' )
  COUNT_PART=$( lsblk | grep 'part' \
    | grep -c -Eoe 'sd[a-z][1-9]' )
  COUNT_MNT=$( lsblk | grep 'part' | grep 'sd[a-z][1-9]' \
    | grep -c -Eoe "$PATH_ROOT.+" )


function show_block {
  if [[ "$PARTs" == '' ]]; then
    LABEL=''
  fi
  BLOCK="$LABEL"
  echo $BLOCK
  echo $BLOCK
}

function show_color {
  if (( $COUNT_MNT == $COUNT_PART )); then
    echo $COLOR_WHTE
  else
    echo $COLOR_GRLT
  fi
}


show_block
show_color


