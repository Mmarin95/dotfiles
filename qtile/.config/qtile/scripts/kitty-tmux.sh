#!/bin/bash

if tmux has-session -t "$USER" 2>/dev/null; then
    exec tmux attach-session -t "$USER"
else
    exec tmux new-session -s "$USER"
fi

