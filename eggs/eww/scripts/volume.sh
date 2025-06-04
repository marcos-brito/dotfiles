COMMAND="amixer sget 'Master'"
VOLUME_LEVEL_REGEX="\d+(?=%)"
MUTED_REGEX="(?<=\[)(on|off)(?=\])"

function on_volume_change {
	pactl subscribe | grep --line-buffered "sink #" | while read -r line; do
		$1
	done
}

function get_level {
	volume_level=$(echo $(${COMMAND}) | grep -oP $VOLUME_LEVEL_REGEX | head -n 1)

	echo $volume_level
}

on_volume_change get_level
