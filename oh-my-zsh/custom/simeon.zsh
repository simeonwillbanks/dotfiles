rvm_path="$HOME/Repositories/rvm"
if [[ -d $rvm_path ]]; then
  export rvm_path=$rvm_path
fi
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"

alias rake='noglob rake'
alias mvim='nocorrect mvim'
alias v='mvim .'
alias gitx='nocorrect gitx'
alias ctagsg="ctags -R --exclude=.git --exclude=log *"
alias pgst='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgsp='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysqlsp="mysql.server stop"
alias mysqlst="mysql.server start"

# aliases.zsh
alias afind="ack --color -i"

# history-substring-search
alias hsh='sed -n "2,/^$/s/^#//p" ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh | more'

alias ipexternal='curl whatismyip.org'

# https://github.com/robbyrussell/oh-my-zsh/issues/31
# noglob Filename generation (globbing) is not performed on any of the words.
alias curl='noglob curl'