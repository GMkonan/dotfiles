#!/bin/sh
# create the panel grid and enter in the right folders
cd code/zapper-dashboard
tmux new-session \; \
  split-window -h \; \
  split-window -v \; \
  split-window -v \; \
  select-pane -t 1 \; \
  resize-pane -y 17 \; \
  send-keys 'cd hasura' C-m \; \
  send-keys 'clear' C-m \; \
  select-pane -t 2 \; \
  resize-pane -y 15 \; \
  send-keys 'cd hasura' C-m \; \
  send-keys 'clear' C-m \; \
  select-pane -t 1 \; \
#take a look in this if you want to modify https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened
# or this https://unix.stackexchange.com/questions/359088/how-do-i-force-a-tmux-window-to-be-a-given-size
# and this https://unix.stackexchange.com/questions/146419/creating-an-alias-for-a-bash-script
