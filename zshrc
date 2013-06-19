# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zeus brew bundler cap gem git github heroku history-substring-search osx rails3 redis-cli ruby)

# TODO why does adding homebrew zsh functions path to $fpath cause git autocomplete errors?
#
# set fpath if necessary for homebrew installation
# @see https://github.com/joelthelion/autojump/blob/f0e45478a7344121ae32963ccc155d5bf2ccd0c7/bin/autojump.zsh#L21-L24
#command -v brew &>/dev/null \
#    && [[ -d "`brew --prefix`/share/zsh/site-functions" ]] \
#    && fpath=(`brew --prefix`/share/zsh/site-functions ${fpath})

source $ZSH/oh-my-zsh.sh

# For now, lets just source the homebrew zsh completion scripts
#source `brew --prefix`/share/zsh/site-functions/*

# Customize to your needs...
export PATH=/usr/local/bin:$HOME/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Add rbenv init to your shell to enable shims and autocompletion
if [[ -d ~/.rbenv ]]; then
  eval "$(rbenv init -)"
fi

# @see http://vim.1045645.n5.nabble.com/MacVim-and-PATH-tt3388705.html#a3392363
# Ensure MacVim has same shell as Terminal
if [[ -a /etc/zshenv ]]; then
  sudo mv /etc/zshenv /etc/zprofile
fi

. $HOME/.jump_around/z.sh

# hub exists and is executable by current process
if [[ -x /usr/local/bin/hub ]]; then
  eval "$(hub alias -s)"
fi
