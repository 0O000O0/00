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
  LABEL='W:'
  INTERFACE="${BLOCK_INSTANCE:-wlp1s0}"
  POWER=$( ip link | grep ${INTERFACE} \
    | grep -Eoe ',UP' | cut -f2 -d ',' )
  STATE=$( ip link | grep ${INTERFACE} \
    | grep -Eoe 'state .+ ' | cut -f2 -d ' ' )
  SSID=$(iw "$INTERFACE" link | grep 'SSID' \
    | cut -f2 -d ':' | cut -c 2- )
  QUALITY=$(iw dev ${INTERFACE} link \
    | grep 'dBm$' | grep -Eoe '-[0-9]{2}' \
    | awk '{print ($1 > -50 ? 100 :($1 < -100 ? 0 : ($1+100)*2))}' )


function press_key {
  if [[ "$POWER" != 'UP' ]]; then
    sudo ip link set $INTERFACE up &
    sudo systemctl start netctl-auto@$INTERFACE.service
    sudo systemctl start dhcpcd
  else
    sudo systemctl stop dhcpcd
    sudo systemctl stop netctl-auto@$INTERFACE.service
    sudo ip link set $INTERFACE down &
  fi
}


press_key


