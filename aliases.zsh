# ===================== alias for frequently used paths ========
alias work="cd $HOME/Documents/Work"
alias note="cd $HOME/Documents/Notes"

# ===================== alias for frequently used commands =====

# set an alias that upgrades system's packages while leaving the packages with alpha, beta, or rc upgrades left alone.
if [ `uname -s` = "Linux" ]; then
  # If nala exists
  if which nala > /dev/null 2>&1; then
    alias system-upgrade="sudo nala update && sudo nala upgrade --no-update \$(apt-get --just-print dist-upgrade | grep 'Inst' | grep -E '\\(.*(alpha|a[0-9]|beta|b[0-9]|rc).*\\)' | cut -d' ' -f2 | xargs -I{} echo '--exclude {}')"
  elif which apt > /dev/null 2>&1; then
    # Upgrades system's packages while leaving the packages with alpha, beta, or rc upgrades left alone (using apt instead of nala)
    native-system-upgrade() {
      sudo apt update
      sudo apt-get --just-print dist-upgrade | grep 'Inst' | grep -E '\(.*(alpha|a[0-9]|beta|b[0-9]|rc).*\)' | cut -d " " -f2 | xargs sudo apt-mark hold | cut -d" " -f1 > /tmp/marked-as-hold.tx
      sudo apt dist-upgrade
      cat /tmp/marked-as-hold.txt | xargs sudo apt-mark unhold
    }
    echo "Install `nala` to have a better system upgrade experience."
  fi
fi

# ls alias for colorful lists in linux
if [ `uname -s` = "Linux" ]; then
  alias ls='ls --color'
fi

# copy alias
if [ `uname -s` = "Linux" ]; then
  alias cft="xclip -selection clipboard"
elif [ `uname -s` = "Darwin" ]; then
  alias cft="pbcopy"
else
  echo "Unknown uname '`uname -s`', did not register a copy from terminal alias"
fi

# Fix copy buffer issue
if [ `uname -s` = "Linux" ]; then
  # In linux
  alias fix-copy="sudo sysctl vm.dirty_bytes=100000000"
fi


# open :)
if [ `uname -s` = "Linux" ]; then
  alias open="xdg-open"
fi

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
alias gcm='git checkout main'
