#!/usr/bin/env bash

## Author  : Aditya Shakya
## Fixed and customized by: Federico "EvilScript" Torrielli

# # #
# Available Styles
# # #
# style_1     style_2     style_3     style_4     style_5     style_6
# style_7     style_8     style_9     style_10    style_11    style_12

theme="style_7"
dir="$HOME/.config/rofi/launchers/colorful"

# dark
ALPHA="#3b4252"
BG="#3b4252"
FG="#FFFFFFff"
SELECT="#d8dee9"

# accent colors
COLORS=('#EC7875' '#61C766' '#FDD835' '#42A5F5' '#BA68C8' '#4DD0E1' '#00B19F' \
		'#FBC02D' '#E57C46' '#AC8476' '#6D8895' '#EC407A' '#B9C244' '#6C77BB')
ACCENT="#5e81ac"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
