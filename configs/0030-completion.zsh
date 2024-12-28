# Add completion functions direcoties to the fpath
fpath+=$ZSH_COMPLETION_FUNCTIONS
fpath+=$ZSH/plugins/zsh-completions/src

# Initialize the completion engine
autoload -U compaudit compinit
compinit
compaudit

# Initialize bash compatible completion engine for Abnormal completions
autoload -U +X bashcompinit
bashcompinit

# Abnormal completions
complete -C `which aws_completer` aws
complete -C `which terraform` -o nospace terraform

# Enable menu for completions
zmodload zsh/complist
zstyle ':completion:*' menu select

# Try to pack the completion list in fewer lines
setopt LIST_PACKED

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END        # Always move the cursor to the end after a completion has been performed

# Show hidden files in completion results
# _comp_options+=(globdots)

# Specify completer functions
zstyle ':completion:*' completer _extensions _expand_alias _complete _approximate
# zstyle ':completion:*' completer _complete _arguments _files _correct _approximate _match _expand

# Setup completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH/.zcompcache"

# Have more verbose completions
zstyle ':completion:*' verbose true


# Colorful completeions
if [ `uname -s` = "Darwin" ]; then
  # In MacOS
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
else
  # In linux
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

# Add automatic description to completions without a description if possible
zstyle ':completion:*' auto-description 'specify: %d'

# Add description of the auto complete action if available
zstyle ':completion:*' format 'Completing %d'

# Group completions by tag if completion list contains more than a single tag.
zstyle ':completion:*' group-name ''

# Add prompt at the bottom of the page if completion results don't fit in a single page
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

# Add prompt at the bottom of the page while scrolling if completion results don't fit in a single page
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s

zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Prevent the use of compctl
zstyle ':completion:*' use-compctl false

