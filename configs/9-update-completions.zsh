function update-completions {
    # AWS
    # complete -C `which aws_completer` aws

    # Hatch
    _HATCH_COMPLETE=zsh_source hatch >| $ZSH_COMPLETION_FUNCTIONS/_hatch

    # Podman
    podman completion zsh -f "${ZSH_COMPLETION_FUNCTIONS}/_podman"

    # Poetry (desabled)
    # poetry completions zsh >| "${ZSH_COMPLETION_FUNCTIONS}/_poetry" &|

    # Rust (rustup & cargo)
    rustup completions zsh >| "$ZSH_COMPLETION_FUNCTIONS/_rustup" &|
    cp "$(rustc +${${(z)$(rustup default)}[1]} --print sysroot)"/share/zsh/site-functions/_cargo $ZSH_COMPLETION_FUNCTIONS/_cargo

    # Kubectl
    kubectl completion zsh >| ${ZSH_COMPLETION_FUNCTIONS}/_kubectl

    # Brew (only on MacOS)
    if [ `uname -s` = "Darwin" ] && [ which brew > /dev/null 2>&1 ]; then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    fi

    # NVM
    if [ "`uname -s`" = "Darwin" ]; then
        source /opt/homebrew/opt/nvm/etc/bash_completion.d/nvm
    else
        source $NVM_DIR/bash_completion
    fi
}

setopt LOCAL_OPTIONS NO_MONITOR
update-completions &
