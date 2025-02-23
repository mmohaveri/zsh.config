# Add completion functions direcoties to the fpath
fpath+=$ZSH_COMPLETION_FUNCTIONS
fpath+=$ZSH_GEN_COMPLETION_FUNCTIONS
fpath+=$ZSH/plugins/zsh-completions/src

# Initialize the completion engine
autoload -U compaudit compinit
compinit
compaudit

# Initialize bash compatible completion engine for Abnormal completions
autoload -U +X bashcompinit
bashcompinit

# Setup completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH/.zcompcache"

# Prevent the use of compctl (zsh legacy completion system)
zstyle ':completion:*' use-compctl false
