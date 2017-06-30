#!/bin/bash

SESSION_NAME='trio'

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    tmux new-session -s ${SESSION_NAME} -n 'trio' -d
    tmux split-window -h
    tmux split-window -v
fi

tmux attach -t ${SESSION_NAME}
