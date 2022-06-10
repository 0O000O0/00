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
  LABEL='V:'
  COLOR_GRLT=${COLOR_GRLT:-#a0a0a0}
  COLOR_RRRR=${COLOR_RRRR:-#ff0000}
  COLOR_OOOO=${COLOR_OOOO:-#ff8000}
  COLOR_YYYY=${COLOR_YYYY:-#ffff00}
  COLOR_LLLL=${COLOR_LLLL:-#80ff00}
  COLOR_GGGG=${COLOR_GGGG:-#00ff00}
  SINK=$( pactl info | grep 'Default Sink:' \
    | cut -f2 -d ':' )
  MUTE=$( pactl list sinks | grep -A 8 "Name:$SINK" \
    | grep 'Mute:' | cut -f2 -d ":" )
  BALANCE=$( pactl list sinks | grep -A 8 "Name:$SINK" \
    | grep 'balance' | grep -Eoe '[0-9]+\.' | cut -f1 -d '.' )
  VOLUME=$( pactl list sinks | grep -A 8 "Name:$SINK" \
    | grep 'Volume: \(front\|mono\)' \
    | grep -Eoe '[0-9]+%' | cut -f1 -d '%' )
  VOLUME_R=$( pactl list sinks | grep -A 8 "Name:$SINK" \
    | grep 'Volume: \(front\|mono\)' | grep -Eoe 'right:.+' \
    | grep -Eoe '[0-9]{2}%|[0-9]{3}%' | cut -f1 -d '%')


function show_block {
  if [[ "$MUTE" =~ 'yes' ]]; then
    VOLUME="M"
  elif (( $BALANCE == 0 )); then
    VOLUME=$VOLUME_R
  fi
  BLOCK="$LABEL$VOLUME"
  echo $BLOCK
  echo $BLOCK
}

function show_color {
  if [[ "$MUTE" =~ 'yes' ]]; then
    echo $COLOR_GRLT
  elif (( $VOLUME > 100 )); then
    echo $COLOR_RRRR
  fi
}


show_block
show_color


