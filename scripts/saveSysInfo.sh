#!/bin/bash

if [ ! -f "$HOME/sysinfo" ]
then
    echo "Installed Date:" >> ~/sysinfo
    date >> ~/sysinfo
    echo "" >> ~/sysinfo
    echo "OS Info:" >> ~/sysinfo
    grep -E '^(VERSION|NAME)=' /etc/os-release >> ~/sysinfo
fi