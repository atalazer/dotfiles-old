#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/scripts/rofi/colors.rasi"

# Get colors
pywal_get() {
    WAL="wal -q -t"
    if [ -z "$1" ]; then
        $WAL -R
    elif [ -n "$1" ] && [ -f "$1" ]; then
	    $WAL -i "$1"
    fi
}

# Change colors
change_color() {
	# polybar
	sed --follow-symlinks -i -e "s/background = #.*/background = $BG/g" "$PFILE"
	sed --follow-symlinks -i -e "s/foreground = #.*/foreground = $FG/g" "$PFILE"
	sed --follow-symlinks -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade1 = #.*/shade1 = $SH1/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade2 = #.*/shade2 = $SH2/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade3 = #.*/shade3 = $SH3/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade4 = #.*/shade4 = $SH4/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade5 = #.*/shade5 = $SH5/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade6 = #.*/shade6 = $SH6/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade7 = #.*/shade7 = $SH7/g" "$PFILE"
	sed --follow-symlinks -i -e "s/shade8 = #.*/shade8 = $SH8/g" "$PFILE"

	# rofi
	cat > "$RFILE" <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  bg1:   ${SH2}FF;
	  bg2:   ${SH3}FF;
	  bg3:   ${SH4}FF;
	  fg:    ${FG}FF;
	}
	EOF

	polybar-msg cmd restart
}

# Main
if command -v "wal" > /dev/null 2>&1 ;then
    pywal_get "$1"

    # Source the pywal color file
    [ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

    BG="$(printf "%s\n" "$background")"
    FG="$(printf "%s\n" "$foreground")"
    FGA="$(printf "%s\n" "$foreground")"
    SH1="$(printf "%s\n" "$color0")"
    SH2="$(printf "%s\n" "$color8")"
    SH3="$(printf "%s\n" "$color0")"
    SH4="$(printf "%s\n" "$color8")"
    SH5="$(printf "%s\n" "$color0")"
    SH6="$(printf "%s\n" "$color8")"
    SH7="$(printf "%s\n" "$color0")"
    SH8="$(printf "%s\n" "$color7")"

    change_color
else
	echo "[!] 'pywal' is not installed."
fi
