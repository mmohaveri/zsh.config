function update-completions {
    # AWS
    # complete -C `which aws_completer` aws

    # Hatch
    if which hatch > /dev/null 2>&1; then
        _HATCH_COMPLETE=zsh_source hatch >| $ZSH_COMPLETION_FUNCTIONS/_hatch
    fi

    # Podman
    if which podman > /dev/null 2>&1; then
        podman completion zsh -f "${ZSH_COMPLETION_FUNCTIONS}/_podman"
    fi

    # Poetry (desabled)
    if which poetry > /dev/null 2>&1; then
        poetry completions zsh >| "${ZSH_COMPLETION_FUNCTIONS}/_poetry" &|
    fi

    # Rust (rustup & cargo)
    if which rustup > /dev/null 2>&1; then
        rustup completions zsh >| "$ZSH_COMPLETION_FUNCTIONS/_rustup" &|
        cp "$(rustc +${${(z)$(rustup default)}[1]} --print sysroot)"/share/zsh/site-functions/_cargo $ZSH_COMPLETION_FUNCTIONS/_cargo
    fi

    # Kubectl
    if which kubectl > /dev/null 2>&1; then
        kubectl completion zsh >| ${ZSH_COMPLETION_FUNCTIONS}/_kubectl
    fi

    # Brew
    if which brew > /dev/null 2>&1; then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    fi

    # NVM
    if [ "`uname -s`" = "Darwin" ]; then
        source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
    else
        source $NVM_DIR/bash_completion
    fi

    # HetznerCloud CLI
    if which hcloud > /dev/null 2>&1; then
        hcloud completion zsh > ${ZSH_COMPLETION_FUNCTIONS}/_hcloud
    fi

    # OpenFGA client
    if which fga > /dev/null 2>&1; then
        fga completion zsh > ${ZSH_COMPLETION_FUNCTIONS}/_fga
    fi

    # UV
    if which uv > /dev/null 2>&1; then
        uv --generate-shell-completion zsh > ${ZSH_COMPLETION_FUNCTIONS}/_uv
    fi

    # UVX
    if which uvx > /dev/null 2>&1; then
        uvx --generate-shell-completion zsh > ${ZSH_COMPLETION_FUNCTIONS}/_uvx
    fi
}

setopt LOCAL_OPTIONS NO_MONITOR
update-completions &
