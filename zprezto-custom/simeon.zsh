if [[ -d "$HOME/Repositories/rvm" ]]; then
  export rvm_path="$HOME/Repositories/rvm"
fi
export VISUAL="/usr/local/bin/mvim"
export EDITOR="/usr/local/bin/mvim"

# Faster ruby
# @see https://gist.github.com/1688857
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

# Export ENV for gist cli
export GITHUB_USER=sfw@simeonfosterwillbanks.com
export GITHUB_PASSWORD=$(security 2>&1 >/dev/null find-generic-password -gs github.password | sed 's/password: "\(.*\)"/\1/')
# Example of adding item to Keychain
# security add-generic-password -a YOUR_LOCAL_OSX_USER -s github.password -w YOUR_GITHUB_PASSWORD

# The GOPATH environment variable lists places to look for Go code
export GOPATH="$HOME/Projects/gocode"

alias rit='ri -T'
alias tm='top -o rsize'
alias tu='top -o cpu'
alias rake='noglob rake'
alias mvim='nocorrect mvim'
alias tree='nocorrect tree'
alias v='mvim .'
alias gitx='nocorrect gitx'
alias ctagsg="ctags -R --exclude=.git --exclude=log *"
alias pgst='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgsp='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysqlsp="mysql.server stop"
alias mysqlst="mysql.server start"

# gem readme
alias gemr='gem readme -e cat'
function gemro() { gemr $1 | marked > ~/Documentation/$1.html && open ~/Documentation/$1.html }

# aliases.zsh
alias afind="ack --color -i"

# history-substring-search
alias hsh='sed -n "2,/^$/s/^#//p" ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh | more'

alias myip='curl ifconfig.me'

# https://github.com/robbyrussell/oh-my-zsh/issues/31
# noglob Filename generation (globbing) is not performed on any of the words.
alias curl='noglob curl'

# Gist cli shortcuts for diffs
function gistd() { g diff | gist -po -tdiff -d"$1" }
function gistdf() { g diff -- "$1" | gist -po -tdiff -d"$2" }

# RSpec shortcuts
function bers() { bundle exec rake spec SPEC="$1" }
function ber() { bundle exec rspec $1 }
unalias zs # set by zeus plugin
function zs() { zeus rspec $1 }

# Generate migration and copy file to clipboard
function zgm() {
  zeus generate migration $1 | ruby -e 'print STDIN.read.scan(/db\/migrate.*/)[0]' | pbcopy
}

unalias bi # set by bundler plugin
alias bi='bundle install; bower install'