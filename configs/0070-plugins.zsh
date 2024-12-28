# ===================== Load Plugins ===========================
plugins=(
    # NOTE: zsh-autosuggestions CAN NOT be sourced more than once,
    # so you won't be able to re-source .zshrc
    "zsh-autosuggestions"
    "zsh-manydots-magic"
    "fast-syntax-highlighting"
)

for plugin in "${plugins[@]}"; do
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
done

# ===================== Plugin like settings ===================

# `cd` into a directory if the command issued does not exist
# but a directory with the same name does.
setopt AUTO_CD
