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
  LABEL='B:'
  COLOR_GRLT=${COLOR_GRLT:-#a0a0a0}
  COLOR_RRRR=${COLOR_RRRR:-#ff0000}
  COLOR_OOOO=${COLOR_OOOO:-#ff8000}
  COLOR_YYYY=${COLOR_YYYY:-#ffff00}
  COLOR_LLLL=${COLOR_LLLL:-#80ff00}
  COLOR_GGGG=${COLOR_GGGG:-#00ff00}
  BRIGHTNESS=$(xbacklight -get | cut -f1 -d'.')


function show_block {
  BLOCK="$LABEL$BRIGHTNESS"
  echo $BLOCK
  echo $BLOCK
}


show_block


