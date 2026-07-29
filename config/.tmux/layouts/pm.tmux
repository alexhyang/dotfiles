# pm.tmux - source with `tmux source-file ~/.tmux/layouts/pm.tmux`
send-keys -t 0 "wk" C-m

split-window -h
send-keys -t 1 "pomo" C-m

split-window -v
send-keys -t 2 "tdlc" C-m

