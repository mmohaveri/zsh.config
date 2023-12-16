# More info on TERMCAP codes can be found from terminfo man page.
export LESS="--RAW-CONTROL-CHARS"
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 6) # cyan 
# Start bold 
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# End bold, blinkding, standout, underline 
export LESS_TERMCAP_me=$(tput sgr0)
# Enter stand out mode
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End stand out mode
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Enter underline mode
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# Exit underline mode
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
# Turn on reverse video mode
export LESS_TERMCAP_mr=$(tput rev)
# Turn on half‐bright
export LESS_TERMCAP_mh=$(tput dim)
# Enter subscript mode
export LESS_TERMCAP_ZN=$(tput ssubm)
# End subscript mode
export LESS_TERMCAP_ZV=$(tput rsubm)
# Enter superscript mode
export LESS_TERMCAP_ZO=$(tput ssupm)
# End superscript mode
export LESS_TERMCAP_ZW=$(tput rsupm)
# For Konsole and Gnome-terminal
export GROFF_NO_SGR=1 

