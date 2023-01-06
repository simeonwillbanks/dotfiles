#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(/opt/homebrew/bin/rbenv init - zsh)"
eval "$(/opt/homebrew/bin/nodenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# Customize to your needs...
alias k9="kill -9"
alias c='code .'
alias v='vim .'

# ruby-build installs a non-Homebrew OpenSSL for each Ruby version installed and these are never upgraded.
# To link Rubies to Homebrew's OpenSSL 1.1 (which is upgraded) add the following to your ~/.zshrc:
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"


# Edit postgres history with vim
export PSQL_EDITOR=/usr/local/bin/vim

# vscode
path=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $path)

# local binstubs
path=("./bin" $path)

# user base for pipenv
path=("$HOME/.local/bin" $path)

export PATH

export PKG_CONFIG_PATH="/opt/homebrew/opt/imagemagick@6/lib/pkgconfig"

source ~/.env
