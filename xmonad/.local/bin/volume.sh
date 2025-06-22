#!/bin/bash

MIXER=Master
COMMAND=set
ARG=$1

if [ -z "$ARG" ]; then
	COMMAND=get
fi

FIFO=$HOME/.local/fifo/xm_vol

OUTPUT=$(amixer $COMMAND $MIXER $ARG | awk 'END{gsub("\[|\]",""); print $4, $6}')

FORMATTED_OUTPUT=$(echo $OUTPUT | awk 'status = $2 == "off" ? "M" : " " {print status$1}')

if [[ $FORMATTED_OUTPUT != M* ]]; then
	# intensity based on volume %
	VALUE=$(tr -dc '0-9' <<< $FORMATTED_OUTPUT)
	if [[ $VALUE -gt 70 ]]; then
		COLOR=lightgreen
	elif [[ $VALUE -gt 30 ]]; then
		COLOR=green
	else
		COLOR=darkgreen
	fi
else
	# color for muted
	COLOR=darkred
fi

tee $FIFO <<< "<fc=$COLOR>$FORMATTED_OUTPUT</fc>"

