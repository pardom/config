function get_window_id() {
	yabai -m query --windows | jq -e ".[] | select(.app==\"$1\" and .title==\"$2\") | .id"
}

function kitty_quake_show() {
	yabai -m window $1 --move abs:0:0
	yabai -m window $1 --resize abs:10000:450
	yabai -m window $1 --focus $1
}

function kitty_quake_hide() {
	yabai -m window $1 --move abs:0:-10000
}

function kitty_quake() {
	APP_INSTANCE=$(pgrep -a -f ".*kitty.*")
	WINDOW_ID=$(get_window_id kitty "$1")

	if [ -z $APP_INSTANCE ] || [ -z $WINDOW_ID ]; then
		kitty -1 --instance-group "$1" --title "$1" -o hide_window_decorations=titlebar-and-corners &

		while [[ -z $WINDOW_ID ]]; do
			WINDOW_ID=$(get_window_id kitty "$1")
		done

		kitty_quake_show $WINDOW_ID
	else
		INFO=$(yabai -m query --windows --window $WINDOW_ID)
		FOCUS=$(echo $INFO | jq '.["has-focus"]')
		Y_POS=$(echo $INFO | jq '.frame.y')

		if [[ $Y_POS < 0 ]]; then
			kitty_quake_show $WINDOW_ID
		else
			if [[ $FOCUS == "false" ]]; then
				kitty_quake_show $WINDOW_ID
			else
				kitty_quake_hide $WINDOW_ID
			fi
		fi
	fi

}

kitty_quake $1
