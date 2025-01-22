#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

separator_right=(
	icon=
	icon.font="$NERD_FONT:Regular:16.0"
	background.padding_left=10
	label.drawing=off
	click_script='sketchybar --trigger toggle_stats'
	icon.color="$TEXT"
)

sketchybar  --add item separator_right right \
	          --set separator_right "${separator_right[@]}"


cpu=(
	label.font="$FONT:Heavy:12"
	label=CPU%
	label.color="$LABEL_COLOR"
	icon.font="$NERD_FONT:Bold:18.0"
	icon="$CPU"
	icon.color="$BLUE"
	update_freq=15
	mach_helper="$HELPER"
	script="$PLUGIN_DIR/stats/scripts/cpu.sh"
)

sketchybar 	--add item cpu.percent right 					\
						--set cpu.percent "${cpu[@]}"


memory=(label.font="$FONT:Heavy:12"
	label.color="$TEXT"
	icon="$MEMORY"
	icon.font="$NERD_FONT:Bold:18.0"
	icon.color="$GREEN"
	update_freq=15
	script="$PLUGIN_DIR/stats/scripts/ram.sh"
)

sketchybar 	--add item memory right 		\
						--set memory "${memory[@]}"

disk=(
	label.font="JetBrains Mono Nerd Font:Bold:12"
	label.color="$TEXT"
	icon="$DISK"
	icon.font="$NERD_FONT:Bold:18.0"
	icon.color="$MAROON"
	update_freq=60
	script="$PLUGIN_DIR/stats/scripts/disk.sh"
)

sketchybar --add item disk right 		\
					 --set disk "${disk[@]}"

# network_down=(
# 	y_offset=-7
# 	label.font="$FONT:Heavy:10"
# 	label.color="$TEXT"
# 	icon="$NETWORK_DOWN"
# 	icon.font="$NERD_FONT:Bold:16.0"
# 	icon.color="$GREEN"
# 	icon.highlight_color="$BLUE"
# 	update_freq=1
# )
#
# network_up=(
# 	background.padding_right=-70
# 	y_offset=7
# 	label.font="$FONT:Heavy:10"
# 	label.color="$TEXT"
# 	icon="$NETWORK_UP"
# 	icon.font="$NERD_FONT:Bold:16.0"
# 	icon.color="$GREEN"
# 	icon.highlight_color="$BLUE"
# 	update_freq=1
# 	script="$PLUGIN_DIR/stats/scripts/network.sh"
# )
#
# sketchybar 	--add item network.down right 						\
# 						--set network.down "${network_down[@]}" 	\
# 						--add item network.up right 							\
# 						--set network.up "${network_up[@]}"
#


