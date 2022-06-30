#!/bin/sh

# create the panel grid and enter in the right folders
cd code/zapper-dashboard

SESSION=$USER

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'Work'

#splits
tmux split-window -h
tmux split-window -v
tmux split-window -v
#tmux split-window -v

#pane 0
tmux select-pane -t 0
tmux resize-pane -R 18

#pane 1
tmux select-pane -t 1
#tmux resize-pane -U 8
#tmux send-keys 'pnpm dev' C-m
#tmux send-keys 'clear' C-m

#pane 2
tmux select-pane -t 2
#tmux resize-pane -U 8
tmux send-keys 'cd apps' C-m
tmux send-keys 'clear' C-m

#pane 3
tmux select-pane -t 3
#tmux resize-pane -U 9
tmux send-keys 'cd packages/hasura' C-m
tmux send-keys 'clear' C-m

#pane 4
# tmux select-pane -t 4
# tmux resize-pane -D 5
# tmux send-keys 'cd hasura' C-m
# tmux send-keys 'clear' C-m

#re-select first pane again
tmux select-pane -t 0

# # Set default window
tmux select-window -t $SESSION:1

# # Attach to session
tmux -2 attach-session -t $SESSION

#take a look in this if you want to modify https://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened
# or this https://unix.stackexchange.com/questions/359088/how-do-i-force-a-tmux-window-to-be-a-given-size
# and this https://unix.stackexchange.com/questions/146419/creating-an-alias-for-a-bash-script
# https://superuser.com/questions/1560523/how-do-i-resize-tmux-pane-by-holding-down-prefix-and-arrow-key-for-a-while#:~:text=To%20resize%20tmux%20panes%2C%20you,%2C%20U%2C%20L%2C%20R.
# https://unix.stackexchange.com/questions/553463/how-can-i-programmatically-get-this-layout-in-tmux