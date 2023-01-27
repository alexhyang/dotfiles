#!/bin/bash
source-file ~/.tmux.conf

# window 1: ref
new-session -s research -n ref
split-window -h

# window 2: notes
new-window -n notes
split-window -h
select-pane -t 0

