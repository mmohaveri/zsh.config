# cd: preview directory's content
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# systemd: preview unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# Any file: Preview content
export LESSOPEN='|$ZSH_SCRIPTS/lessfilter.sh %s'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'

# git: Preview changes
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview 'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview 'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview 'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview 'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
esac'

zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview 'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
esac'

# Kill: Preview of commandline arguments of the process
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
# zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

zstyle ':fzf-tab:complete:bindkey:option-M-1' fzf-preview 'case $group in
keymap)
  bindkey -M $word | batcat -ltsv
  ;;
esac'

zstyle ':fzf-tab:complete:flatpak:*' fzf-preview 'case "$group" in
"argument") flatpak $word --help ;;
esac'
