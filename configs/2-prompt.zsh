# straship is binary which need to be installed separately.
# It can be installed from source using cargo:
# `cargo install starship --locked`
# If it's not installed, you can fallback of spaceship-prompt

# SPACESHIP_PROMPT_ORDER=(
#      dir            # Current directory section
#      git            # Git information
#      node           # Node.js version
#      venv           # Python virtual environment
#      python         # Python version
#      golang         # Golang version
#      rust           # Rust version
#      jobs           # Background jobs
#      exit_code      # Exit code section
#      sudo           # Sudo indicator
#      char           # Prompt character
# )
#
# SPACESHIP_USER_SHOW=true
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_PROMPT_SEPARATE_LINE=false
# SPACESHIP_CHAR_SYMBOL_ROOT="#"
# SPACESHIP_CHAR_SYMBOL="❯"
# SPACESHIP_CHAR_PREFIX=""
# SPACESHIP_CHAR_SUFFIX=" "
# SPACESHIP_EXIT_CODE_SHOW=true
# SPACESHIP_DIR_TRUNC=3
#
# source $ZSH/prompts/spaceship/spaceship.zsh

export STARSHIP_CONFIG=$ZSH/starship.toml
eval "$(starship init zsh)"
