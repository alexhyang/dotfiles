#!/bin/bash
source-file ~/.tmux.conf

# window 0: ref
new-session -s dev -n ref

# window 1: ide
new-window -n ide
split-window -v -p 20
select-pane -t 0

# window 2: shell
new-window -n shell
select-pane -t 0

select-window -t dev:1
