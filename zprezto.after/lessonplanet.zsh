alias work="cd $HOME/Sites/lessonplanet"
alias workopen="mvim $HOME/Sites/lessonplanet"
alias gcod="git checkout development"
alias gupd="git fetch origin && git rebase origin/development"
alias gird="git rebase -i origin/development"
alias migrations\?="git diff --name-only master development | ack migrate"

export LP_CODE_ROOT_PATH=/Users/simeon/Sites
