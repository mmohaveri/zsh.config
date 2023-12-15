# This is a simplified version of Oh My Zsh's rust plugin.
# It's simplified because:
#   1. It assumes that cargo and rustup commands exist and does not check for them.
#   2. It will not autoload and bind the autocomplete files if they don't exist yet,
#      hence you'll need to reload your shell one more time after the plugin loads
#      for the 1st time.
# I think this simplification is justified as it speeds up the shell's load time.

# Generate (and re-generate) completion files in the background
rustup completions zsh >| "$ZSH_COMPLETIONS/_rustup" &|
cat >| "$ZSH_COMPLETIONS/_cargo" << 'EOF'
#compdef cargo
source "$(rustc +${${(z)$(rustup default)}[1]} --print sysroot)"/share/zsh/site-functions/_cargo
EOF
