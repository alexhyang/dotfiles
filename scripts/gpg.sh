#!/bin/bash

# Set up SSH agent
# https://www.gnupg.org/documentation/manuals/gnupg/Agent-Examples.html
export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
eval $(ssh-agent -s);
ssh-add ~/.ssh/id_ed25519;
ssh-add -l
