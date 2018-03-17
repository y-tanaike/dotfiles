#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

###########################
# for node
# nvm設定
# nvm alias default v6.8.1
[[ -s ~/.nvm/nvm.sh ]] && . ~/.nvm/nvm.sh
nvm use default
npm_dir=${NVM_PATH}_modules
export NODE_PATH=$npm_dir

# 毎回実行しなくていいように設定を反映させるコマンドも書いておく
source ~/.nvm/nvm.sh
##########################
# The next line updates PATH for the Google Cloud SDK.
source '/Users/tanaike/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/tanaike/google-cloud-sdk/completion.zsh.inc'
