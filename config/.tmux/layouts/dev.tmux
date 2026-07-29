# dev.tmux - source with `tmux source-file ~/.tmux/layouts/dev.tmux`
# window 0: shell
rename-window shell

# window 1: ide
new-window -n ide   # -n: name flag
split-window -v -p 20
select-pane -t 0

# window 2: ref
new-window -n ref
select-pane -t 0

select-window -t 1
