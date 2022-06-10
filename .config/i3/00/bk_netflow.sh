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
  LABEL='|'
  ETHN='eno1'
  WLAN='wlp1s0'
  ROUTE=$( ip route | grep 'default' \
    | grep -Eoe 'dev [a-z|0-9]+' | cut -f2 -d ' ' )
  INTERFACE=''
  RX_DATA=''
  RX_SPEED=''
  TX_DATA=''
  TX_SPEED=''

function get_data {
  ROUTE=$( ip route | grep 'default' \
    | grep -Eoe 'dev [a-z|0-9]+' | cut -f2 -d ' ' )
  if [[ "$ROUTE" == '' ]]; then
    LABEL=''
    INTERFACE=''
    RX_SPEED=''
    TX_SPEED=''
    return
  elif [[ "$ROUTE" == "$ETHN" ]]; then
    INTERFACE="$ETHN"
  elif [[ "$ROUTE" == "$WLAN" ]]; then
    INTERFACE="$WLAN"
  fi
  RX_DATA=$( cat /proc/net/dev | grep "$INTERFACE" \
    | awk '{print $2}'  )
  TX_DATA=$( cat /proc/net/dev | grep "$INTERFACE" \
    | awk '{print $10}' )
}

function show_block {
  echo $BLOCK
  RX_DATA_TEMP=0
  RX_DATA_PREV=0
  RX_DATA_NEXT=0
  TX_DATA_TEMP=0
  TX_DATA_PREV=0
  TX_DATA_NEXT=0
  while [[ "$ROUTE" != '' ]];
  do
    # data ( before & after ) a second
    get_data
    RX_DATA_PREV=$RX_DATA_TEMP  # old
    RX_DATA_NEXT=$RX_DATA       # new
    RX_DATA_TEMP=$RX_DATA       # new
    # speed ( K | M ) per second
    RX_SPEED=$(($RX_DATA_NEXT-$RX_DATA_PREV))
    if   [[ $RX_SPEED -lt 1000 ]]; then
      RX_SPEED=$( echo $RX_SPEED | \
        awk '{printf "%03dB/s", $1}' )
    elif [[ $RX_SPEED -lt 1024000 ]]; then
      RX_SPEED=$( echo $RX_SPEED | \
        awk '{printf "%03dK/s", $1/1024}' )
    elif [[ $RX_SPEED -lt 1048576000 ]]; then
      RX_SPEED=$( echo $RX_SPEED | \
        awk '{printf "%.1fM/s", $1/1048576}' )
    else
      RX_SPEED=$( echo $RX_SPEED | \
        awk '{printf "%d", $1}' )
    fi
      # data ( before & after ) a second
      TX_DATA_PREV=$TX_DATA_TEMP  # old
      TX_DATA_NEXT=$TX_DATA       # new
      TX_DATA_TEMP=$TX_DATA       # new
      # speed ( K | M ) per second
      TX_SPEED=$(($TX_DATA_NEXT-$TX_DATA_PREV))
    TX_SPEED=$(($TX_DATA_NEXT-$TX_DATA_PREV))
    if   [[ $TX_SPEED -lt 1000 ]]; then
      TX_SPEED=$( echo $TX_SPEED | \
        awk '{printf "%03dB/s", $1}' )
    elif [[ $TX_SPEED -lt 1024000 ]]; then
      TX_SPEED=$( echo $TX_SPEED | \
        awk '{printf "%03dK/s", $1/1024}' )
    elif [[ $TX_SPEED -lt 1048576000 ]]; then
      TX_SPEED=$( echo $TX_SPEED | \
        awk '{printf "%.1fM/s", $1/1048576}' )
    else
      TX_SPEED=$( echo $TX_SPEED | \
        awk '{printf "%d", $1}' )
    fi
    # block show after sleep
    sleep 1
    get_data
    #BLOCK="$LABEL $ROUTE $RX_DATA $RX_DATA_TEMP $RX_SPEED $RX_DATA_PREV $RX_DATA_NEXT "
    BLOCK="$RX_SPEED$LABEL$TX_SPEED"
    echo $BLOCK
  done
}


show_block


