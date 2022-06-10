#!/usr/bin/env bash


# I3 config, auto exec
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


# auto exec


#feh --bg-fill --randomize /home/00/02_photo/00/* &
feh --bg-fill --randomize /home/00/02_photo/00/wallpaper_000.jpg &
picom -bcfCG --sw-opti                                           &

fcitx5 &
sleep 0.5

#/home/oo/.config/00/autostart.sh &
/home/oo/.config/00/xmodmap.sh  &
/home/oo/.config/00/xrandr.sh   &


