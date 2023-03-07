#!/bin/bash

if [ ! -f "$HOME/sysinfo" ]
then
    echo "OS Info:" >> ~/sysinfo
    date "+DATE='%Y-%m-%d %T %Z'" >> ~/sysinfo
    grep -E '^(VERSION|NAME)=' /etc/os-release >> ~/sysinfo
    echo "~/sysinfo created!"
fi

