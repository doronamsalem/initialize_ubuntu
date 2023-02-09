#!/bin/bash
#will be activate every terminal session, file path must match ~/.bashrc conntent

#useful aliases
alias c='clear'
alias s='sudo'

#git shortcut
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
  #auto git add, commit, push script
  lazyManWork=$(find ~ -type f -name git_shortcut.sh)
  alias gitit='source ${lazyManWork}'

#change layout script bind to f10 key
changeLayout=$(find ~ -type f -name change_layout.sh)
bind '"\e[21~":"source ${changeLayout}\n"'
