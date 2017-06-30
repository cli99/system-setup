#!/bin/bash

SESSION_NAME='twover'

tmux has-session -t ${SESSION_NAME}
if [ $? != 0 ]
then
    tmux new-session -s ${SESSION_NAME} -n 'twover' -d
    tmux split-window -v
fi

tmux attach -t ${SESSION_NAME}
