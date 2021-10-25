#!/bin/bash

if [ $2 = "up" ]; then
    echo "Setting up slcan0 interface..."
    modprobe can
    modprobe can-raw
    modprobe slcan
    sudo slcand -o -s5 -t hw  -o -S 2000000 $1
    ip link set up slcan0
else
    echo "Shutting down slcan0 interface..."
   ip link set down slcan0
    killall slcand
fi
