#!/usr/bin/env zsh

if [[ ${(P)env_var_name} == "" ]]; then
  echo "add path for \$$1"
  return 1
else
  return 0
fi
