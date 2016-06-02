#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Your zsh customizations outside of Prezto...
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto.after" ]]; then
  for after_prezto in "${ZDOTDIR:-$HOME}"/.zprezto.after/**/*.zsh; do
    source "$after_prezto"
  done
fi
