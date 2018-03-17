source ~/.git-completion.bash
source /opt/local/etc/bash_completion.d/git-completion.bash

HISTSIZE=1000
HISTFILESIZE=2000

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias h='history'

# for NodeJS
export NVM_DIR="/Users/tanaike/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
