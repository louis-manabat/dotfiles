# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu no

# Custom if statement to compenstate for the issues with Mac not recognising dircolors
# StackExchange: https://unix.stackexchange.com/a/91978/429940
if whence dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi

zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# kubectl completion
if command -v kubectl >/dev/null 2>&1; then
  source "$XDG_CONFIG_HOME/k3s/zsh_completion"
fi

# # alacritty completion
# if command -v alacritty >/dev/null 2>&1; then
#   source "$ZSHPLUGINS/alacritty/extra/completions/_alacritty"
# fi

# eza completion
if command -v eza >/dev/null 2>&1; then
  export FPATH="$ZSHPLUGINS/eza/completions/zsh:$FPATH"
fi