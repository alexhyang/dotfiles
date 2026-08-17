#!/usr/bin/env bash

# Set up SSH agent
# https://www.gnupg.org/documentation/manuals/gnupg/Agent-Examples.html
GPG_TTY=$(tty)
export GPG_TTY
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
  export SSH_AUTH_SOCK
fi
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh-add -l
