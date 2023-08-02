# tmux

This document contains notes about tmux, an open-source terminal multiplexer for Unix-like operating systems.

Contents:
:InsertToc

## Default Commands
*   sessions
    ```sh
    tmux                                   # start a new session
    tmux new-session -t <session-name>     # start new session with name
    tmux kill-session -t <session-name>    # kill a session
    tmux kill-session -a                   # kill all sessions
    tmux kill-session -a -t <session-name> # kill all sessions but the specified one
    tmux ls                                # list all sessions
    tmux attach                            # attach to last session
    tmux attach -t <session-name>          # attach to a specified session
    ^b $                                   # rename session
    ^b d                                   # detach from session
    ^b s                                   # show all sessions
    ```

*   windows
    ```sh
    ^b c     # create new window
    ^b ,     # rename new window
    ^b &     # close current window
    ^b w     # list all windows
    ^b p     # previous window
    ^b n     # next window
    ^b 0...9 # select window by number
    ^b l     # toggle last active window
    ```

*   panes
    ```sh
    ^b %       # split pane with horizontal layout
    ^b \"      # split pane with vertical layout
    ^b <arrow> # select pane to the direction
    ^b x       # close current pane

    # move panes
    ^b {       # move current pane to the previous position
    ^b }       # move current pane to the next position
    ^b ^o      # rotate window 'up'
    ^b M-o     # rotate window 'down'
    ^b !       # move the current pane into a new separate window
    ```

## tmux.conf
*   reload tmux config file:
    ```sh
    tmux source-file ~/.tmux.conf # from shell prompt
    source-file ~/.tmux.conf      # from tmux command prompt
    ```

## Tasks (default key mappings)
```bash
# launch and close panes, windows, and sessions
tmux                                 # start tmux session from terminal
:new                                 # start new session in tmux
tmux kill-session -t <session-name>  # kill session
^b d                                 # detach current session
tmux a [-t <session-name>]           # attach to last session

^b ?                                 # list key bindings

^b c                                 # create new window
^b &                                 # close current window

^b %                                 # split pane with horizontal layout
^b \"                                # split pane with vertial layout
^b x                                 # close current pane

# navigation
tmux ls                              # show all tmux sessions in terminal
^b s                                 # show all sessions
^b w                                 # session and window preview
^b q                                 # show pane numbers

^b ( / )                             # move to previous / next session
^b p / n                             # move to previous / next window
^b <index>                           # switch window by number
^b UP/DOWN/LEFT/RIGHT                # switch to pane to the direction
^b ;                                 # toggle last active pane

# names
^b ,      # rename window
^b $      # rename session

# layouts
^b z                             # toggle pane zoom
^b !                             # convert pain into window

^b space                         # toggle between pane layouts
^b ^UP/DOWN/LEFT/RIGHT           # resize current pane height/width
^b { / }                         # move current pane to previous/next position

:swap-window -t <num> [-s <num>] # move [current] window to dst position

# copy mode
^b [    # enter copy mode
^b ]    # paste content

space   # start selection
Esc     # clear selection
enter   # end selection

/       # search forward
?       # seasech backward
n/N     # next/previous search result

# misc
:set -g <OPTION>    # set OPTION for all sessions
:setw -g <OPTION>   # set OPTION for all windows
```

## References
*   [tmux - Wikipedia](https://en.wikipedia.org/wiki/Tmux)
*   [tmux official documentation - getting started](https://github.com/tmux/tmux/wiki/Getting-Started)
*   [tmux cheat sheet](https://tmuxcheatsheet.com/)
*   [Blog: How to Reload a Tmux Config File](https://linuxhint.com/how-to-reload-tmux-config-file/)
*   [Blog: Customize Tmux Configuration](https://linuxhint.com/customize-tmux-configuration/)
*   [Blog: Customize tmux status bar](https://rudra.dev/posts/a-mininal-tmux-configuration-from-scratch/#customize-status-bar)
