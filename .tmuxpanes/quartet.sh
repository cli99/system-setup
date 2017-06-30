#!/bin/bash

SESSION_NAME='quartet'

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    tmux new-session -s ${SESSION_NAME} -n 'quartet' -d
    tmux split-window -h
    tmux split-window -v
    tmux select-pane -t 0
    tmux split-window -v
    tmux select-pane -t 0
fi

tmux attach -t ${SESSION_NAME}
