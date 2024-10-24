declare -A cursor_xterm_control_sequence
cursor_xterm_control_sequence=(
    [BlockBlinking]='\e[1 q'
    [Block]='\e[2 q'
    [UnderscoreBlinking]='\e[3 q'
    [Underscore]='\e[4 q'
    [BarBlinking]='\e[5 q'
    [Bar]='\e[6 q'
)

function set-cursor-type-based-on-current-keymap {
    if [[ ${KEYMAP} == vicmd ]] then                    # VI command mode
        echo -ne $cursor_xterm_control_sequence[BlockBlinking]
    elif [[ ${KEYMAP} == visual ]] then                 # VI visual mode (selection active)
        echo -ne $cursor_xterm_control_sequence[UnderscoreBlinking]
    elif [[ ${KEYMAP} == main ]] ||                     # Main mode (if vi emulation is enbabled will be viins)
        [[ ${KEYMAP} == viins ]] ||                     # VI insert mode
        [[ ${KEYMAP} == '' ]] then
        echo -ne $cursor_xterm_control_sequence[BarBlinking]
    fi
}

function set-initial-cursor-type {
    echo -ne $cursor_beam_xterm_control_sequence[BarBlinking]
}

bindkey -v                              # Set viins as the default keymap (enable vi mode)
export KEYTIMEOUT=1

zle -N zle-keymap-select set-cursor-type-based-on-current-keymap
zle -N zle-line-init set-initial-cursor-type
