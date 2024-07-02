# XDG envs
export XDG_CONFIG_HOME="$HOME"/dotfiles
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZSHALIASES="$ZDOTDIR/aliases"
export ZSHPLUGINS="$ZDOTDIR/plugins"

# Golang export
export PATH="$PATH:/usr/local/go/bin"

# Zoxide envs
export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/.bin"

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi