export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export ZSH=$XDG_CONFIG_HOME/zsh
export ZSH_PLUGINS=$ZSH/plugins
export ZSH_PROMPTS=$ZSH/prompts
export ZSH_COMPLETIONS=$ZSH/completions
export LANG=en_US.UTF-8
export EDITOR='nvim'
export GOPATH="$HOME/go"

export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials
# ====================== Path Additions ==================
export PATH="$HOME/.local/bin:$PATH"                    # Path where npx & pipx install their locally installed executables
export PATH="/usr/local/nvim/bin:$PATH"                 # neovim executable path
export PATH="$HOME/.cargo/bin:$PATH"                    # Rust executable path
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"       # Go executable paths
export PATH="/usr/local/lua-language-server/bin:$PATH"  # lua-language-server executable path
export PATH="/usr/local/ltex-ls/bin:$PATH"              # LaTeX Language Server executable path
export PATH="/opt/homebrew/bin/:$PATH"			        # HomeBrew path in MacOS

# ====================== ZSH History Settings ==================
export HISTFILE=$ZSH/zsh_history
export SAVEHIST=1000000000
export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY               # Immediate append (instead of append at the shell exit)
setopt EXTENDED_HISTORY                 # Store time stamp of a command as well
setopt HIST_FIND_NO_DUPS                # Don't show duplicate commands when stepping through commands
setopt HIST_IGNORE_ALL_DUPS             # Don't save duplicate commands in history
setopt HIST_SAVE_NO_DUPS                # Don't write duplicate entries in the history file.
setopt SHARE_HISTORY                    # Share history between all sessions.
setopt HIST_IGNORE_SPACE                # Don't record an entry starting with a space.

# ===================== Load Plugins ===========================
plugins=(
    "completion-setting"
    "zsh-completions"
    "fast-syntax-highlighting"
    "zsh-autosuggestions"               # This plugin can not be sourced more than once, so you won't be able to source .zshrc
    "zsh-manydots-magic"
    "zsh-history-substring-search"
    "hatch"
    "rust"
    "brew"
    "podman"
    "man-pages-color"
)

for plugin in "${plugins[@]}"; do
    source $ZSH_PLUGINS/$plugin/$plugin.plugin.zsh
done

# ===================== Load key bindings and aliases ==========
source $ZSH/aliases.zsh
source $ZSH/key-bindings.zsh

# ===================== load prompt ============================
SPACESHIP_PROMPT_ORDER=(
  dir            # Current directory section
  git            # Git section (git_branch + git_status)
  venv           # virtualenv section
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

SPACESHIP_USER_SHOW=true
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
SPACESHIP_CHAR_SYMBOL_ROOT="#"
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_CHAR_SUFFIX=" "

source $ZSH_PROMPTS/spaceship/spaceship.zsh

# ===================== Python virtualenvs settings =============
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_LINK_PATH=`which virtualenvwrapper.sh`
export VIRTUALENVWRAPPER_REAL_PATH=`readlink -f $VIRTUALENVWRAPPER_LINK_PATH`
export VIRTUALENVWRAPPER_PYTHON="$(dirname $VIRTUALENVWRAPPER_REAL_PATH)/python"
source virtualenvwrapper.sh

# ===================== NVM settings ============================
export NVM_DIR="$HOME/.nvm"

if [ "`uname -s`" = "Darwin" ]; then
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_complet
else
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# ===================== Load AWS Plugin ===========================
# It needs to run last or the complete command will not be found!
source $ZSH_PLUGINS/aws/aws.plugin.zsh

# ===================== CUDA settings ===========================
# export PATH="/usr/local/cuda-11.0/bin:$PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH"

# ===================== Tex Live settings =======================
# export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"

# ===================== kubectl settings ========================
# alias k="kubectl"
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
