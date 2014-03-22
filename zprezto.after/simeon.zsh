# Base16 Shell
BASE16_SCHEME="base16-tomorrow"
BASE16_SHELL="$HOME/.base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL

if [[ -d "$HOME/Repositories/rvm" ]]; then
  export rvm_path="$HOME/Repositories/rvm"
fi
export VISUAL="/usr/bin/vim"
export EDITOR="/usr/bin/vim"
# @see http://stackoverflow.com/a/17279810/177524
# @see https://www.ruby-forum.com/topic/4413311
export NOKOGIRI_USE_SYSTEM_LIBRARIES=1

# Faster ruby
# @see https://gist.github.com/1688857
# TODO change to RUBY_GC_HEAP_INIT_SLOTS
#export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

# Export ENV for gist cli
export GITHUB_USER=sfw@simeonfosterwillbanks.com
export GITHUB_PASSWORD=$(security 2>&1 >/dev/null find-generic-password -gs github.password | sed 's/password: "\(.*\)"/\1/')
# Example of adding item to Keychain
# security add-generic-password -a YOUR_LOCAL_OSX_USER -s github.password -w YOUR_GITHUB_PASSWORD

alias tmux='TERM=screen-256color tmux'
alias rit='ri -T'
alias tm='top -o rsize'
alias tu='top -o cpu'
alias rake='noglob rake'
alias bundle='noglob bundle'
alias tree='nocorrect tree'
alias v='vim .'
alias gitx='nocorrect gitx'
alias ctagsg="ctags -R --exclude=.git --exclude=log *"
alias pgst='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgsp='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias mysqlsp="mysql.server stop"
alias mysqlst="mysql.server start"
alias gcom="git checkout master"
alias k9="kill -9"
alias reload="exec $SHELL"
alias gg="git grep --break --heading --line-number"

# generate bundled gem ri documentation
begd='bundle exec gem rdoc --all --overwrite --ri'

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

alias be='bundle exec'
alias bi='bundle install; bower install'
function bo() { cd `bundle show $1` }

# Add X11 to end of path
path=($path "/user/X11/bin")

# Add heroku tookbelt
path=("/usr/local/heroku/bin" $path)

# https://github.com/rupa/z
. `brew --prefix`/etc/profile.d/z.sh
alias j='z'

# https://github.com/wfarr/goenv
export PATH="$HOME/.goenv/bin:$PATH"
eval "$(goenv init -)"

function gopathset {
  # GOPATH for current Go version
  export GOPATH="$HOME/Projects/gocode/$(goenv version)"
  export PATH="$GOPATH/bin:$PATH"
}
gopathset

# Initialize Go workspace for current Go version
function goworkspaceinit {
  dirs=(bin pkg src);
  for dir in $dirs;
  do
    mkdir -p "$GOPATH/$dir"
  done
}

