# Add completion functions direcoties to the fpath
fpath+=$ZSH_COMPLETION_FUNCTIONS
fpath+=$ZSH/plugins/zsh-completions/src

# Initialize the completion engine
autoload -U compaudit compinit
compinit
compaudit

# Initialize bash compatible completion engine for Abnormal completions
autoload -U +X bashcompinit
bashcompinit

# Enable menu for completions
zmodload zsh/complist
zstyle ':completion:*' menu select

# Try to pack the completion list in fewer lines
setopt LIST_PACKED

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END        # Always move the cursor to the end after a completion has been performed

# Setup completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH/.zcompcache"

# Have more verbose completions
zstyle ':completion:*' verbose true

# Prevent the use of compctl (zsh legacy completion system)
zstyle ':completion:*' use-compctl false
