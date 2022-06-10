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
  INTERFACE="${BLOCK_INSTANCE:-hci0}"
  POWER=$( bluetoothctl show | grep 'Powered:' \
    | cut -f2 -d ':' | cut -f2 -d ' ' )
  #MAC=$( hcitool con | grep -A 5 'Connections:' \
  #  | grep -Eoe '..:..:..:..:..:..' )
  NAME=$( bluetoothctl info $MAC | grep 'Name:' \
    | cut -f2 -d ':' | cut -c 2- )
  PAIRED=$( bluetoothctl info $MAC | grep 'Paired:' \
    | cut -f2 -d ' ' )
  CONNECTED=$( bluetoothctl info $MAC | grep 'Connected:' \
    | cut -f2 -d ' ' )
  #DEVICES=$( bluetoothctl paired-devices | grep 'Device' \
  #  | cut -f2 -d ' ' )

function press_key {
  MAC='88:2D:53:20:4A:02' # xiaodu-A3-6081
  #MAC='60:F4:3A:A6:B3:45'  # EDIFIER Lolli Pods Plus
  #echo --$POWER--
  PAIRED=$( bluetoothctl info $MAC | grep 'Paired:' \
    | cut -f2 -d ' ' )
  CONNECTED=$( bluetoothctl info $MAC | grep 'Connected:' \
    | cut -f2 -d ' ' )
  if   [[ "$POWER" != 'yes' ]]; then
    bluetoothctl power on
    bluetoothctl discoverable off
    sleep 0.5
    echo =======================================================
    if [[ "$PAIRED" != 'yes' ]]; then
      echo abc
      bluetoothctl scan on &
      bluetoothctl remove $MAC
      sleep 0.5
    fi
    echo pair =======================================================
    while [[ "$PAIRED" != 'yes' ]]; do
      bluetoothctl pair $MAC
      sleep 0.5
      PAIRED=$( bluetoothctl info $MAC | grep 'Paired:' \
        | cut -f2 -d ' ' )
      sleep 0.5
    done
    echo conn =======================================================
    while [[ "$CONNECTED" != 'yes' ]]; do
      bluetoothctl scan off
      bluetoothctl connect $MAC
      sleep 0.5
      CONNECTED=$( bluetoothctl info $MAC | grep 'Connected:' \
        | cut -f2 -d ' ' )
      sleep 0.5
    done
  elif [[ "$POWER" =~ 'yes' ]]; then
    bluetoothctl disconnect $MAC
    while [[ "$CONNECTED" = 'yes' ]]; do
      CONNECTED=$( bluetoothctl info $MAC | grep 'Connected:' \
        | cut -f2 -d ' ' )
      sleep 0.5
      continue
    done
    bluetoothctl power off
  fi
}


press_key


