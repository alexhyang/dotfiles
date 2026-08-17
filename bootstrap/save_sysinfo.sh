#!/usr/bin/env bash
echo "Saving system information..."

if [ ! -f "$HOME/sysinfo" ]
then
  {
    echo "OS Info:"
    date "+DATE='%Y-%m-%d %T %Z'"
    grep -E '^(VERSION|NAME)=' /etc/os-release
    echo "MACHINE=<update information here>"
  } >> ~/sysinfo
fi

