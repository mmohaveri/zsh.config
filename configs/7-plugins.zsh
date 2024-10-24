# ===================== Load Plugins ===========================
plugins=(
    "zsh-autosuggestions"               # This plugin can not be sourced more than once, so you won't be able to source .zshrc
    "zsh-manydots-magic"
    "man-pages-color"
    "fast-syntax-highlighting"
)

for plugin in "${plugins[@]}"; do
    source $ZSH/plugins/$plugin/$plugin.plugin.zsh
done
