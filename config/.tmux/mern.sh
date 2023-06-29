#!/bin/bash
source-file ~/.tmux.conf

# window 0: ref
new-session -s mern -n ref
split-window -h

# window 1: client
new-window -n client
split-window -v -p 20
select-pane -t 0

# window 2: server
new-window -n server
split-window -v -p 20
select-pane -t 0

# window 3: shell
new-window -n shell
select-pane -t 0

select-window -t mern:1
