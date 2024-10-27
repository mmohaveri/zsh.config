# ===================== Python virtualenvs settings =============
activate-venv() {
    export WORKON_HOME=$HOME/.virtualenvs
    export VIRTUALENVWRAPPER_LINK_PATH=`which virtualenvwrapper.sh`
    export VIRTUALENVWRAPPER_REAL_PATH=`readlink -f $VIRTUALENVWRAPPER_LINK_PATH`
    export VIRTUALENVWRAPPER_PYTHON="$(dirname $VIRTUALENVWRAPPER_REAL_PATH)/python"
    source virtualenvwrapper.sh
    compdef '_files -W $WORKON_HOME -/ -S "" -F "*/*"' workon
}

# ===================== Alias to open ipython in virtualenv =====
alias ipy="python -c 'import IPython;
IPython.terminal.ipapp.launch_new_instance()'"

# = Alias to activate a environment (lint by default) in htach ==
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

# # ===================== NVM settings ============================
export NVM_DIR="$HOME/.nvm"

activate-nvm() {
    if [ "`uname -s`" = "Darwin" ]; then
      source "/opt/homebrew/opt/nvm/nvm.sh"
    else
      source "$NVM_DIR/nvm.sh"
    fi
}

# ====================== AWS CLI settings =========================
export AWS_CONFIG_FILE=$XDG_CONFIG_HOME/aws/config
export AWS_SHARED_CREDENTIALS_FILE=$XDG_CONFIG_HOME/aws/credentials

# ===================== Tex Live settings =======================
# export PATH="/usr/local/texlive/2020/bin/x86_64-linux:$PATH"

# ===================== CUDA settings ===========================
# export PATH="/usr/local/cuda-11.0/bin:$PATH"
# export LD_LIBRARY_PATH="/usr/local/cuda-11.0/lib64:$LD_LIBRARY_PATH"

# ===================== kubectl settings ========================
# alias k="kubectl"
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
