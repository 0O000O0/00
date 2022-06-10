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
  #LABEL='U'
  PATH_ROOT="/boot/0000/"
  DISKs=$( lsblk | grep 'disk' | grep -Eoe 'sd[a-z]' )
  PARTs=$( lsblk | grep 'part' | grep -Eoe 'sd[a-z][1-9]' )
  COUNT_PART=$( lsblk | grep 'part' \
    | grep -c -Eoe 'sd[a-z][1-9]' )
  COUNT_MNT=$( lsblk | grep 'part' | grep 'sd[a-z][1-9]' \
    | grep -c -Eoe "$PATH_ROOT.+" )
  #COUNT_DISK=$( lsblk | grep 'disk' | grep -c sd[a-z] )


function press_key {
  if [[ "$PARTs" != '' ]]; then
    N=0
    for DISK in $DISKs; do
      N=$(($N+1))
      for PART in $PARTs; do
        # only do when part belong to disk
        if [[ "$PART" =~ "$DISK" ]]; then
          NUM1=$N
          NUM2=$( echo $PART | grep -Eoe '[1-9]+' )
          NUM=$((70+$NUM1+$NUM2))
          LABEL="0$( echo $NUM | awk '{printf("%c", $1)}' )"
          SIGN='_'
          FS_LABEL=$( udevadm info -n $PART \
            | grep 'ID_FS_LABEL=' | cut -f2 -d '=' )
          FS_TYPE=$( udevadm info -n $PART \
            | grep 'ID_FS_TYPE=' | cut -f2 -d '=' )
          #DIR="$NUM1$NUM2$SIGN$FS_LABEL"
          DIR="$LABEL$SIGN$FS_LABEL"
          PATH_DEV="/dev/$PART"
          PATH_MNT="$PATH_ROOT$DIR"
          # state before change
          STATE_DIR=$( ls "$PATH_ROOT" | grep -Eoe "$DIR" )
          STATE_MNT=$( lsblk -fs | grep -Eoe "$PATH_MNT" )
          echo $DISK $PART $PATH_DEV $PATH_MNT $FS_LABEL $FS_TYPE \
            $STATE_DIR $STATE_MNT $COUNT_PART $COUNT_MNT
          # if mount then umount
          if [[ "$STATE_DIR" != '' && "$STATE_MNT" != '' ]]; then
            sudo umount $PATH_MNT
            sudo rmdir $PATH_MNT
            continue
          fi
          # if not umount all part, then not mount
          if (( $COUNT_MNT != 0 )); then
            break
          fi
          # if not mount then mount
          STATE_DIR=$( ls "$PATH_ROOT" | grep -Eoe "$DIR" )
          if [[ "$STATE_DIR" == "" ]]; then
            sudo mkdir $PATH_MNT
            sudo chmod u+rw $PATH_MNT
            sudo mount -o uid=1000 -o gid=100 $PATH_DEV $PATH_MNT
          fi
          STATE_MNT=$( lsblk -fs | grep -Eoe "$PATH_MNT" )
          if [[ "$STATE_MNT" == "" ]]; then
            sudo rmdir $PATH_MNT
          fi
          # state after change
          STATE_DIR=$( ls "$PATH_ROOT" | grep -Eoe "$DIR" )
          STATE_MNT=$( lsblk -fs | grep -Eoe "$PATH_MNT" )
          echo $DISK $PART $PATH_DEV $PATH_MNT $FS_LABEL $FS_TYPE \
            $STATE_DIR $STATE_MNT $COUNT_PART $COUNT_MNT
        fi
      done
    done
  fi
  sleep 1
}


press_key


