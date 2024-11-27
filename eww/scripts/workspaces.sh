#!/bin/bash

COMMAND="hyprctl activeworkspace"
REGEX="s/[^0-9]*\([0-9][0-9]*\).*/\1/"

function on_workspace_change {
    socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do
		if [[ $line == *"workspace"* ]]; then
			$1
		fi
	done
}

function generate_literal {
	active=$(echo $(${COMMAND}) | sed $REGEX)

	literal="
    (box 
     :orientation 'horizontal' 
     :halign 'start'
     :spacing 5
     :class 'workspaces'"

	for i in {1..5}; do
		if [ $i -eq $active ]; then
			literal+="(button :class \"workspaces__button--active\" :onclick \"hyprctl dispatch workspace $i\" $i)"
			continue
		fi
		literal+="(button :class \"workspaces__button\" :onclick \"hyprctl dispatch workspace $i\" $i)"
	done

	literal+=")"

	echo $literal
}

on_workspace_change generate_literal
