#!/bin/bash
source-file ~/.tmux.conf

# window 1: ref
new-session -s dev -n ref
split-window -h

# window 2: ide
new-window -n ide
split-window -v -p 20
select-pane -t 1
split-window -h -p 50
select-pane -t 0

# window 3: shell
new-window -n shell
select-pane -t 0

select-window -t dev:2
