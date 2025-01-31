#!/bin/bash
source-file ~/.tmux.conf

# window 0: shell
new-session -s dev -n shell

# window 1: ide
new-window -n ide
split-window -v -p 20
select-pane -t 0

# window 2: ref
new-window -n ref
select-pane -t 0

select-window -t dev:1
