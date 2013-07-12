export PATH=/usr/local/bin:$HOME/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$GOPATH/bin

# Add rbenv init to your shell to enable shims and autocompletion
if [[ -d ~/.rbenv ]]; then
  eval "$(rbenv init -)"
fi
