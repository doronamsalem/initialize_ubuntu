#will be activate every terminal session, file path must match ~/.bashrc "source" command
#!/bin/bash

first_initialize=false #for software installations change to true
export PATH_INITIALIZE_UBUNTU=/home/dorona3/Desktop/initialize_ubuntu

#useful aliases
alias c='clear'
alias s='sudo'
alias k='kubectl'

#git shortcut
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
  #auto git add, commit, push script
  lazyManWork=$(find $PATH_INITIALIZE_UBUNTU -type f -name git_shortcut.sh)
  alias gitit='source ${lazyManWork}'

#change layout script bind to f10 key
changeLayout=$(find $PATH_INITIALIZE_UBUNTU -type f -name change_layout.sh)
bind '"\e[21~":"source ${changeLayout}\n"'

#softwares installations
softwares_installations=$(find $PATH_INITIALIZE_UBUNTU -type f -name softwares.sh)
source ${softwares_installations}
