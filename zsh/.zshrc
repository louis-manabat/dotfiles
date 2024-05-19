# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
source "$ZDOTDIR/history.zsh"

# Completation
source "$ZDOTDIR/completion.zsh"

typeset -A alias_descriptions

# Sourcing all files in aliases directory as a function for constant repurpose
source_aliases() {
  for f in $ZSHALIASES/*; do
    source $f
  done
}

source_aliases

# antidote plugin manager
source "$ZSHPLUGINS/antidote/antidote.zsh"
antidote load "$ZDOTDIR/zsh_plugins.txt"

# Applying p10k to zsh so customisation applies
source "$ZSHPLUGINS/powerlevel10k/powerlevel10k.zsh-theme"
[[ ! -f "$ZDOTDIR/.p10k.zsh" ]] || source "$ZDOTDIR/.p10k.zsh"

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# Use modern completion system
autoload -Uz compinit
compinit
 
# Source fzf
[ -f "$XDG_CONFIG_HOME/fzf/fzf.zsh" ] && source "$XDG_CONFIG_HOME/fzf/fzf.zsh"

# fzf-tab init if installed
if command -v fzf >/dev/null 2>&1; then
  source "$ZSHPLUGINS/fzf-tab/fzf-tab.plugin.zsh"
fi

# Evaluate homebrew - Mac only
if [ -d "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#------------------------------------------------------
# Conditional inits start - package needs to be install
#------------------------------------------------------

# Zoxide init
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Run the pokemon-colorscripts package if it exists
# Note: Keep this at the end of the .zshrc file as it needs to run last after setup
if command -v pokemon-colorscripts >/dev/null 2>&1; then
  shiny_arg=""

  if [ $(shuf -i 1-1365 -n 1) -eq 393 ]; then
    shiny_arg="-s"
  fi

  if [ $(( $(shuf -i 1-100 -n 1) % 2)) -eq 0 ]; then
    pokemon-colorscripts -n piplup $shiny_arg
  else
    pokemon-colorscripts -r $shiny_arg
  fi
fi