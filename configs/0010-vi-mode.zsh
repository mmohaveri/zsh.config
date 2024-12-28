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
export KEYTIMEOUT=400                   # Set key input timeout (for multi key inputs) to 400ms

# Set callback for initialization and key map change events
zle -N zle-keymap-select set-cursor-type-based-on-current-keymap
zle -N zle-line-init set-initial-cursor-type

# Add basic text objects ('"`...)
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

# Add surrond actions
autoload -Uz surround
zle -N delete-surround surround
zle -N add-surround surround
zle -N change-surround surround
bindkey -M vicmd cs change-surround
bindkey -M vicmd ds delete-surround
bindkey -M vicmd ys add-surround
bindkey -M visual S add-surround

# Add vim for editing commandline in a text editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd vi edit-command-line
