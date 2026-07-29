# mern.tmux - source with `tmux source-file ~/.tmux/layouts/mern.tmux`
# window 0: ref
rename-window ref

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

select-window -t 1
