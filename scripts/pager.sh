#!/usr/bin/env bash
set -eu

# Replace shell process with nvim
# Duplicate stdin (0) to file descriptior 63
# Redirect stdin to /dev/null to disconnect stdin from terminal
# Run nvim without reading initialization files
# Set nvim to exit when "q" is pressed
# Set nvim numbers
# Set shell zsh
# Set scrollback to a large number (not sure why :D)
# Enable terminal colors
# Hide status line
# Integrate vim's copy register with system's clipboard
# Sotp insert/terminal mode as soon as a terminal buffer is entered
# Runs the following inside a neovim terminal buffer:
#   - Pass copid stdin (63) through sed to filter out hyperlink related terminal escape sequences
#   - Wait a bit
#   - Update terminal window title

exec nvim 63<&0 0</dev/null \
    -u NONE \
    -c "map <silent> q :qa!<CR>" \
    -c "set number shell=bash scrollback=100000 termguicolors laststatus=0 clipboard+=unnamedplus" \
    -c "autocmd TermEnter * stopinsert" \
    -c 'terminal sed </dev/fd/63 -e "s/'$'\x1b'']8;;file:[^\]*[\]//g" && sleep 0.01 && printf "'$'\x1b'']2;"'
