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
  LABEL='~'
  LABEL_CAPS='A'
  COLOR_WHTE=${COLOR_WHTE:-#ffffff}
  COLOR_GRLT=${COLOR_GRLT:-#a0a0a0}
  COLOR_RRRR=${COLOR_RRRR:-#ff0000}
  COLOR_OOOO=${COLOR_OOOO:-#ff8000}
  COLOR_YYYY=${COLOR_YYYY:-#ffff00}
  COLOR_LLLL=${COLOR_LLLL:-#80ff00}
  COLOR_GGGG=${COLOR_GGGG:-#00ff00}
  CAPSLOCK=$( xset -q | grep 'Caps Lock:' \
    | cut -f3 -d ':' | grep -Eoe '[a-z]+' )

function show_block {
  if [[ "$CAPSLOCK" =~ 'on' ]]; then
    LABEL=''
  else
    LABEL_CAPS=''
  fi
  BLOCK="$LABEL$LABEL_CAPS"
  echo $BLOCK
  echo $BLOCK
}

function show_color {
  if [[ "$CAPSLOCK" =~ 'on' ]]; then
    echo $COLOR_RRRR
  else
    echo $COLOR_YYYY
  fi
}


show_block
show_color


