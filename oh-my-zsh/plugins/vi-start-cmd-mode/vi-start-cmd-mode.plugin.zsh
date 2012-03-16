# http://superuser.com/questions/151803/how-do-i-customize-zshs-vim-mode/273870#273870
zle-line-init() { zle -K vicmd; }
zle -N zle-line-init