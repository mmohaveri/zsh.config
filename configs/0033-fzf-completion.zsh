# FZF's default config
export FZF_DEFAULT_OPTS="--border rounded --bind tab:down,btab:up --color=fg:1,fg+:2"

# Enable fzf shell integration
eval "$(fzf --zsh)"

# Set fzf command, is here just for documentation
zstyle ":fzf-tab:*" fzf-command fzf

# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ":fzf-tab:*" use-fzf-default-opts yes

# No additional flag required, is here just as documentation
zstyle ":fzf-tab:*" fzf-flags ""

# Allow space for accept but only in fzf-tab
zstyle ":fzf-tab:*" fzf-bindings "space:accept"

# switch group using `<` and `>`
zstyle ":fzf-tab:*" switch-group "<" ">"

# Due to the border being active  we need to set this to 4
zstyle ":fzf-tab:*" fzf-pad 4
