# ===================== Setup hIstotry ===========================
export HISTFILE=$ZSH/zsh_history        # History filepath
export HISTSIZE=1000000                 # Maximum events for internal history
export SAVEHIST=1000000000              # Maximum events in history file
export HISTFILESIZE=1000000
export HISTTIMEFORMAT="[%F %T] "

setopt INC_APPEND_HISTORY               # Immediate append (instead of append at the shell exit)
setopt EXTENDED_HISTORY                 # Store time stamp of a command as well
setopt HIST_FIND_NO_DUPS                # Don't show duplicate commands when stepping through commands
setopt HIST_IGNORE_ALL_DUPS             # Don't save duplicate commands in history
setopt HIST_SAVE_NO_DUPS                # Don't write duplicate entries in the history file.
setopt SHARE_HISTORY                    # Share history between all sessions.
setopt HIST_IGNORE_SPACE                # Don't record an entry starting with a space.

source $ZSH/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
