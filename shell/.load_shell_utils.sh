#!/usr/bin/env bash
load_shell_utils() {
  # shellcheck source=/dev/null
  for f in ~/.shell_utils/*.sh; do source "$f"; done
}

