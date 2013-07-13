#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Prezto customizations...
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto.before" ]]; then
  for before_prezto in "${ZDOTDIR:-$HOME}"/.zprezto.before/*.zsh; do
    source "$before_prezto"
  done
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Your zsh customizations outside of Prezto...
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto.after" ]]; then
  for after_prezto in "${ZDOTDIR:-$HOME}"/.zprezto.after/**/*.zsh; do
    source "$after_prezto"
  done
fi
