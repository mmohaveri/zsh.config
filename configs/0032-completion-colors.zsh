# Colorful completeions
if [ `uname -s` = "Darwin" ]; then
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
else
  # Set LS_COLORS environment variable using `dircolors` command
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
fi

# Color auto complete output (syntax is '=pattern=format')
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:parameters'  list-colors '=*=31' # red
zstyle ':completion:*:commands' list-colors '=*=1;32' # green
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
zstyle ':completion:*:options' list-colors '=^(-- *)=34'

# Color kill command's completions
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,cmd --sort=cmd'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=32=31'

# Set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
