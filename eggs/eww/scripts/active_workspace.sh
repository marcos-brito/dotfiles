#!/bin/sh

COMMAND="hyprctl activeworkspace"
REGEX="s/[^0-9]*\([0-9][0-9]*\).*/\1/"

function set_active {
	active=$(echo $(${COMMAND}) | sed $REGEX)

    eww update current_workspace=$active
}


function on_workspace_change {
    socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
		if [[ $line == *"workspace"* ]]; then
			$1
		fi
	done
}

on_workspace_change set_active
