# pm.tmux - source with `tmux source-file ~/.tmux/layouts/pm.tmux`
# window 0: dashboard
send-keys -t 0 "wk" C-m

split-window -h
send-keys -t 1 "pomo" C-m

split-window -v
send-keys -t 2 "tdlc" C-m
select-pane -t 0

# window 1: detailed todo's
new-window -n details
send-keys -t 0 "tdlc" C-m

split-window -h
send-keys -t 1 "tde" C-m

select-window -t 0
