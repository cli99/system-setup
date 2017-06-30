#!/bin/bash

SESSION_NAME='twohor'

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    tmux new-session -s ${SESSION_NAME} -n 'twohor' -d
    tmux split-window -h
fi

tmux attach -t ${SESSION_NAME}
