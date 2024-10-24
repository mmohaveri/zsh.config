bindkey "^[^L" forward-word
bindkey "^[^H" backward-word
bindkey "^[^K" history-substring-search-up
bindkey "^[^J" history-substring-search-down

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
