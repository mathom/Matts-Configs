#!/bin/bash

DEVICE=/sys/class/backlight/acpi_video0/brightness

CURRENT=$(cat $DEVICE)

ADJUSTMENT=$1

NEW=$(($CURRENT + $ADJUSTMENT)) 
NEW=$(($NEW > 100? 100 : $NEW))
NEW=$(($NEW < 0? 0 : $NEW))

echo $NEW > $DEVICE
