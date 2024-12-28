# FZF's default config
export FZF_DEFAULT_OPTS="--border rounded --bind tab:down,btab:up,space:accept --color=fg:1,fg+:2"

# Enable fzf shell integration
eval "$(fzf --zsh)"

# Set fzf command, is here just for documentation
zstyle ':fzf-tab:*' fzf-command fzf

# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# No additional flag required, is here just as documentation
zstyle ':fzf-tab:*' fzf-flags ""

# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
