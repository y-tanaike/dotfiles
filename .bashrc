# source ~/.git-completion.bash
# source /opt/local/etc/bash_completion.d/git-completion.bash

HISTSIZE=1000
HISTFILESIZE=2000

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias h='history'

# for NodeJS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#export GOOGLE_APPLICATION_CREDENTIALS='/Users/yuki.tanaike/UserApp-Prod-f1c66041519c.json'

# JAVA 8 
export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH=/usr/local/bin:$PATH
eval "$(pyenv init -)"

# show git info
source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\n\$ '

