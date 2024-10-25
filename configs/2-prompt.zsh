SPACESHIP_PROMPT_ORDER=(
  dir            # Current directory section
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  git          # Git information
  node          # Node.js version from nvm
  venv   # Python virtual environment
  python
  golang
  rust
  jobs         # Background jobs
)


SPACESHIP_USER_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL_ROOT="#"
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_EXIT_CODE_SHOW=true
SPACESHIP_DIR_TRUNC=3


source $ZSH/prompts/spaceship/spaceship.zsh
