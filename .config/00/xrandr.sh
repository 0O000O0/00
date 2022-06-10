#!/usr/bin/env bash


# XX config, xrandr
  # Copyright (C) 2021 Jessie Chan


# init var
  MNTR_00='eDP'
  MNTR_ALL=$( xrandr | grep ' connected' \
    | awk '{print $1}' )
  COUNT=$( xrandr | grep -c ' connected' )

function set_monitor {
  # return if only one monitor
  if (( COUNT == 1 )); then
    xrandr --output $MNTR_00 --auto --scale 1
    PTH='/home/oo/.config/alacritty/window.yml'
    sed -i -r 's#(size: ).*#\112#g' "$PTH"
    return
  fi
  # return if only one monitor
  for m in $MNTR_ALL
  do
    if [[ $m =~ 'HDMI' ]]; then
      xrandr --output $MNTR_00 --off
      xrandr --output $m --auto --scale 1
      PTH='/home/oo/.config/alacritty/window.yml'
      RES=$( xrandr | grep "$m" \
        | grep -Eoe '[0-9]+x' | cut -f1 -d 'x' )
      if   [[ $RES -lt 1920 ]]; then
        sed -i -r 's#(size: ).*#\108#g' "$PTH"
      elif (( $RES == 1920 )); then
        sed -i -r 's#(size: ).*#\111#g' "$PTH"
      elif (( $RES == 2560 )); then
        sed -i -r 's#(size: ).*#\120#g' "$PTH"
      fi
    fi
  done
}


set_monitor


