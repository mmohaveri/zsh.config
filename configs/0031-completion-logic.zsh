# Abnormal completions
complete -C `which aws_completer` aws
complete -C `which terraform` -o nospace terraform

# Show hidden files in completion results
# _comp_options+=(globdots)

# Specify completer functions
zstyle ':completion:*' completer _extensions _expand_alias _complete _approximate
# zstyle ':completion:*' completer _complete _arguments _files _correct _approximate _match _expand

# Add automatic description to completions without a description if possible
zstyle ':completion:*' auto-description 'specify: %d'

# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# Group completions by tag if completion list contains more than a single tag.
zstyle ':completion:*' group-name ''

# Enable mixed case and case insensitive matches
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
