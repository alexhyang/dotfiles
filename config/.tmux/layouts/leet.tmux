# leet.tmux - source with `tmux source-file ~/.tmux/layouts/leet.tmux`
# window 0: IDE
rename-window IDE

# window 1: test
new-window -n test
select-pane -t 0

select-window -t 0
