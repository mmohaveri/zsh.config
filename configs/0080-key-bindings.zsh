# Allow motions in insert mode (Ctrl+movement)
bindkey "^l" forward-word
bindkey "^h" backward-word
bindkey "^k" history-substring-search-up
bindkey "^j" history-substring-search-down

# Enable `vim edit command line` on VI in vicmd mode.
# Enabled in `vi-mode` file. Is here only for reference.
# bindkey -M vicmd vi edit-command-line

# Enable fzf's file selector widget on Ctrl+F
bindkey -M vicmd '^F' fzf-file-widget
bindkey -M viins '^F' fzf-file-widget
#
# # Enable fzf's cd widget on Alt+C
bindkey -M vicmd '\ec' fzf-cd-widget
bindkey -M viins '\ec' fzf-cd-widget
#
# # Enable fzf's history widget on Ctrl+R
bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

# Trigger fzf-completion on Ctrl+I.
# Enabled by `fzf --zsh` in `completion` file.
# Is here only for reference.
# bindkey '^I' fzf-completion
