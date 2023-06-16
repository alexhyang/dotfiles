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

## References
*   [tmux - Wikipedia](https://en.wikipedia.org/wiki/Tmux)
*   [tmux official documentation - getting started](https://github.com/tmux/tmux/wiki/Getting-Started)
*   [tmux cheat sheet](https://tmuxcheatsheet.com/)
*   [Blog: How to Reload a Tmux Config File](https://linuxhint.com/how-to-reload-tmux-config-file/)
*   [Blog: Customize Tmux Configuration](https://linuxhint.com/customize-tmux-configuration/)
*   [Blog: Customize tmux status bar](https://rudra.dev/posts/a-mininal-tmux-configuration-from-scratch/#customize-status-bar)
