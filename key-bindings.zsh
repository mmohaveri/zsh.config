# ===================== Load VI Mode ===========================
# it should be set before other binds, otherwise will disable them
bindkey -v
export KEYTIMEOUT=1

bindkey "^[^L" forward-word
bindkey "^[^H" backward-word
bindkey "^[^K" history-substring-search-up
bindkey "^[^J" history-substring-search-down

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
