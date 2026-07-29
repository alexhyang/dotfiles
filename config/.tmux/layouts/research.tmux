# research.tmux - source with `tmux source-file ~/.tmux/layouts/research.tmux`
# window 0: ref
rename-window ref
split-window -h

# window 1: notes
new-window -n notes
split-window -h
select-pane -t 0

