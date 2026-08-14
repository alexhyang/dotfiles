#!/usr/bin/env bash
load_shell_utils() {
  for f in ~/.shell_utils/*.sh; do source $f; done
}
