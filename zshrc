export ZSH=$HOME/.config/zsh
export ZSH_PLUGINS=$ZSH/plugins
export ZSH_PROMPTS=$ZSH/prompts
export ZSH_COMPLETIONS=$ZSH/completions
export LANG=en_US.UTF-8
export EDITOR='vim'
export GOPATH="$HOME/go"

# ====================== Path Additions ==================
export PATH="$HOME/.local/bin:$PATH"  # Path where npx & pipx install their locally installed executables
export PATH="/usr/local/nvim/bin:$PATH"  # neovim executable path
export PATH="$HOME/.cargo/bin:$PATH"  # Rust executable path
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"  # Go executable paths 
export PATH="/usr/local/lua-language-server/bin:$PATH"  # lua-language-server executable path
export PATH="/usr/local/ltex-ls/bin:$PATH"  # LTeX Language Server executable path

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

# ====================== Autocompletion Config =================
fpath+=$ZSH_COMPLETIONS
autoload -U compaudit compinit && compinit
zstyle ':completion:*' menu select
setopt ALWAYS_TO_END
setopt LIST_PACKED

# ===================== Load Plugins ===========================
plugins=(
    "zsh-completions"
    "fast-syntax-highlighting"
    "zsh-autosuggestions"
    "zsh-manydots-magic"
    "zsh-history-substring-search"
    "hatch"
    "rust"
)

for plugin in "${plugins[@]}"; do
    source $ZSH_PLUGINS/$plugin/$plugin.plugin.zsh
done

setopt autocd

# ====================== Key bindings ==========================
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[OA" history-substring-search-up
bindkey "^[OB" history-substring-search-down

# ===================== colorful auto complete =================
# The syntax is '=pattern=format'
zstyle ':completion:*:parameters'  list-colors '=*=31' # red
zstyle ':completion:*:commands' list-colors '=*=1;32' # greed 
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
zstyle ':completion:*:options' list-colors '=^(-- *)=34'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

# ===================== colorful less (man pages)===============
# More info on TERMCAP codes can be found from terminfo man page.
export LESS="--RAW-CONTROL-CHARS"
# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 6) # cyan 
# Start bold 
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# End bold, blinkding, standout, underline 
export LESS_TERMCAP_me=$(tput sgr0)
# Enter stand out mode
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End stand out mode
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Enter underline mode
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# Exit underline mode
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
# Turn on reverse video mode
export LESS_TERMCAP_mr=$(tput rev)
# Turn on half‐bright
export LESS_TERMCAP_mh=$(tput dim)
# Enter subscript mode
export LESS_TERMCAP_ZN=$(tput ssubm)
# End subscript mode
export LESS_TERMCAP_ZV=$(tput rsubm)
# Enter superscript mode
export LESS_TERMCAP_ZO=$(tput ssupm)
# End superscript mode
export LESS_TERMCAP_ZW=$(tput rsupm)
# For Konsole and Gnome-terminal
export GROFF_NO_SGR=1 

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

# ===================== frequently used path aliases ===========
export WORK="$HOME/Documents/Work"
alias work="cd $WORK"
alias note="cd $HOME/Documents/Notes"

# ===================== frequently used command aliases ========
# Upgrades system's packages while leaving the packages with alpha, beta, or rc upgrades left alone.
alias system-upgrade="sudo nala update && sudo nala upgrade --no-update \$(apt-get --just-print dist-upgrade | grep 'Inst' | grep -E '\\(.*(alpha|a[0-9]|beta|b[0-9]|rc).*\\)' | cut -d' ' -f2 | xargs -I{} echo '--exclude {}')"

# ls color
alias ls='ls --color=auto'



# copy alias
alias cft="xclip -selection clipboard"

# Fix copy buffer issue
alias fix-copy="sudo sysctl vm.dirty_bytes=100000000"

# open :)
alias open="xdg-open"

# ExpressVPN
alias vpn-on="expressvpn connect"
alias vpn-off="expressvpn disconnect"
alias vpn-status="expressvpn status"

# ipython in virtualenv
alias ipy="python -c 'import IPython;
IPython.terminal.ipapp.launch_new_instance()'"

# neovim alias with a default path.
v() {
     if [[ $# -gt 1 ]]; then
        echo "Error: Too many arguments. You can only pass the name of a single file or directory."
        return 1
    fi


    local path_to_open=$1

    if [[ -z "$1" ]]; then
        path_to_open="."
    fi

    nvim $path_to_open
}

# activate the lint virtual environment in hatch
hatch-activate() {
    if [[ $# -gt 1 ]]; then
        echo "Error: Too many arguments. You can only pass the name of a single hatch environment."
        return 1
    fi
    
    local hatch_env=$1

    if [[ -z "$1" ]]; then
        hatch_env="lint"
    fi

    local env_python_path
    env_python_path=$(hatch env run -e $hatch_env which python3)

    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to get python3 path for hatch environment '$hatch_env'."
        return 1
    fi

    local env_activate_path=$(echo $env_python_path | sed "s/python3/activate/")

    if [[ ! -e $env_activate_path ]]; then
        echo "Error: Activation script '$env_activate_path' not found."
        return 1
    fi

    source $env_activate_path
}

# git aliases
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff'
alias gst='git status'
alias gco='git checkout'
alias gcm='git chekcout main'

# ===================== Python virtualenvs settings =============
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=`which python3.11`
source /usr/local/bin/virtualenvwrapper.sh

# ===================== NVM settings ============================
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ===================== CUDA settings ===========================
# export PATH="/usr/local/cuda-11.0/bin:$PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH"

# ===================== Tex Live settings =======================
# export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"

# ===================== kubectl settings ========================
# alias k="kubectl"
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"


