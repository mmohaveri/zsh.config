# ===================== Load Plugins ===========================
plugins=(
    # NOTE: fzf-tab needs to be loaded after compinit module,
    # but before plugins which will wrap widgets.
    # e.g: zsh-autosuggestions or fast-syntax-highlighting
    "fzf-tab"
    # NOTE: zsh-autosuggestions CAN NOT be sourced more than once,
    # so you won't be able to re-source .zshrc
    "zsh-autosuggestions"
    "zsh-manydots-magic"
    # NOTE: "fast-syntax-highlighting" CAN NOT be sourced more than once,
    # so you won't be able to re-source .zshrc
    "fast-syntax-highlighting"
)

for plugin in "${plugins[@]}"; do
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
done

# ===================== Plugin like settings ===================

# `cd` into a directory if the command issued does not exist
# but a directory with the same name does.
setopt AUTO_CD
