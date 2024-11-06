# '^' Ctrl
bindkey "^l" forward-word
bindkey "^h" backward-word
bindkey "^k" history-substring-search-up
bindkey "^j" history-substring-search-down

# Allow vim motions for menu selection, zsh/complist should be loaded beforehand
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

bindkey -M menuselect '^xg' clear-screen
bindkey -M menuselect '^xi' vi-insert                      # Insert
bindkey -M menuselect '^xh' accept-and-hold                # Hold
bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
bindkey -M menuselect '^xu' undo                           # undo
