#!/usr/bin/env bash
tmux_create_attach() {
  local SESSION_NAME=$1
  local LAYOUT_DIR="$HOME/.tmux/layouts"
  local LAYOUT_FILE="$LAYOUT_DIR/$SESSION_NAME.tmux"

  if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
    echo "Session $SESSION_NAME already exists. Attaching..."
  else
      tmux new-session -d -s "$SESSION_NAME"
      if [[ -f "$LAYOUT_FILE" ]]; then
        tmux source-file "$LAYOUT_FILE"
      else
       tmux source-file "$LAYOUT_DIR/default.tmux"
    fi
  fi
  tmux attach-session -t "$SESSION_NAME"
}

tmux_kill_list() {
  tmux kill-session -t "$1"; tmux ls
}

tmux_list_layouts() {
  ls "$HOME"/.tmux/layouts
}
