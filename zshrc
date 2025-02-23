start_time=$(date +%s%N)

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}
export ZSH=$XDG_CONFIG_HOME/zsh
export ZSH_COMPLETION_FUNCTIONS=$ZSH/completion_functions
export ZSH_SCRIPTS=$ZSH/scripts
export LANG=en_US.UTF-8

export PAGER='pager.sh'
export MANPAGER='nvim +Man!'
export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH="$HOME/go"
export VIRTUAL_ENV_HOME=$XDG_DATA_HOME/virtualenvs

export PATH="$ZSH/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"                    # Path where npx & pipx install their locally installed executables
export PATH="$HOME/.cargo/bin:$PATH"                    # Rust executable path
export PATH="/opt/homebrew/bin/:$PATH"			        # HomeBrew path in MacOS
export PATH="/usr/local/nvim/bin:$PATH"                 # neovim executable path
export PATH="/usr/local/go/bin:$GOPATH/bin:$PATH"       # Go executable paths
export PATH="/usr/local/ltex-ls/bin:$PATH"              # LaTeX Language Server executable path
export PATH="/usr/local/lua-language-server/bin:$PATH"  # lua-language-server executable path


for config_file in $(ls -1v $ZSH/configs/*); do
    source "$config_file"
done

end_time=$(date +%s%N)
exec_time_in_ms=$((($end_time - $start_time) / 1000000))

flock $ZSH/.zsh_load_time.lock -c "echo $exec_time_in_ms >> $ZSH/zsh_load_time.txt"
