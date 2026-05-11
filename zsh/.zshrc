# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename "$ZDOTDIR/.zshrc"

# Use modern completion system
autoload -Uz compinit
compinit

# History
source "$ZDOTDIR/history.zsh"

# Completation
source "$ZDOTDIR/completion.zsh"

# Sourcing all files in aliases directory as a function for constant repurpose
source_aliases() {
  for f in $ZSHALIASES/*; do
    if [ -f $f ]; then
      source $f
    fi
  done
  
  source "$ZSHALIASES/localised_aliases/local_source.sh"
}

source_aliases

# antidote plugin manager
source "$ZSHPLUGINS/antidote/antidote.zsh"
antidote load "$ZDOTDIR/zsh_plugins.txt"

# Evaluate homebrew - Mac only
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# Applying oh my posh configs - most likely switching to json-based configuration
# eval "$(oh-my-posh init zsh --config $ZDOTDIR/oh-my-posh-config.omp.toml)"
eval "$(oh-my-posh init zsh --config $ZDOTDIR/oh-my-posh-config.omp.json)"
 
# Source fzf
[ -f "$XDG_CONFIG_HOME/fzf/fzf.zsh" ] && source "$XDG_CONFIG_HOME/fzf/fzf.zsh"

# fzf-tab init if installed
if (( $+commands[fzf] )) source "$ZSHPLUGINS/fzf-tab/fzf-tab.plugin.zsh"

# Zoxide init
if (( $+commands[zoxide] )) eval "$(zoxide init zsh)"

# Exporting tfenv into $PATH - submodule will look after download
[ -d "$ZSHPLUGINS/tfenv" ] && export PATH="$ZSHPLUGINS/tfenv/bin:$PATH"

#------------------------------------------------------
# Conditional inits start - package needs to be install
#------------------------------------------------------

# Run the pokemon-colorscripts package if it exists
# Note: Keep this at the end of the .zshrc file as it needs to run last after setup
if command -v pokemon-colorscripts >/dev/null 2>&1; then
  shiny_arg=""

  if [ $(shuf -i 1-1365 -n 1) -eq 393 ]; then
    shiny_arg="-s"
  fi

  if [ $(( $(shuf -i 1-100 -n 1) % 3)) -eq 0 ]; then
    pokemon-colorscripts -n piplup $shiny_arg
  else
    pokemon-colorscripts -r $shiny_arg
  fi
fi