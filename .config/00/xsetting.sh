#!/usr/bin/env bash


# XX config, xmodmap
  # Copyright (C) 2021 Jessie Chan


bluetoothctl power off   &
ip link set wlp1s0 down  &
pactl set-sink-volume @DEFAULT_SINK@ 80% &
xbacklight -set 80                       &

libinput-gestures-setup start &
numlockx                      &
#fcitx5                        &


