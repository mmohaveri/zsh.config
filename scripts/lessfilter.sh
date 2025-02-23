#! /usr/bin/env sh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}

if [ -d "$1" ]; then
	eza --git -hl --color=always --icons "$1"
elif [ "$category" = image ]; then
    # Requires chafa and libimage-exiftool-perl
	chafa --size 120x20  -f symbols "$1"
	exiftool "$1"
elif [ "$category" = text ]; then
	batcat --color=always "$1"
else
    echo "Unknown filetype"
fi
