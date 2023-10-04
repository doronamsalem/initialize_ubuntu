# For first activation, execute:
# 1. echo -e '\n#my changes \nexport COUSTOM_CONFIGURATION_DIR=<permenent/path/to/initialize_ubuntu/dir> \nsource $COUSTOM_CONFIGURATION_DIR/main.sh' >> ~/.bashrc
#    change: <permenent/path/to/initialize_ubuntu/dir>
# 2. set first_initialize=true
# 3. start new shell session

#!/bin/bash
export first_initialize=false

#useful aliases
alias vpn='f5fpc -s -t wwvpn.rafael.co.il -u dorona3 -p 211000Dd'
alias vpnout='f5fpc -o'
alias c='clear'
alias s='sudo'
alias k='kubectl'

#git shortcut
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias gb='git branch'
alias gch="git checkout"
alias gitlog="git log --oneline"
alias reset='git reset HEAD~1'
alias clone="git clone"
alias pull="git pull"
  #auto git add, commit, push script
  lazyManWork=$(find $COUSTOM_CONFIGURATION_DIR -type f -name git_shortcut.sh)
  alias gitit='source ${lazyManWork}'

#change layout script bind to f10 key
changeLayout=$(find $COUSTOM_CONFIGURATION_DIR -type f -name change_layout.sh)
bind '"\e[21~":"source ${changeLayout}\n"'

#softwares installations
softwares_installations=$(find $COUSTOM_CONFIGURATION_DIR -type f -name softwares.sh)
source ${softwares_installations}
