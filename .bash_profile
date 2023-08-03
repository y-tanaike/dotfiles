source ~/.tcshrc

export JAVA_HOME="$(/usr/libexec/java_home)"
#export CLASSPATH="$CLASSPATH:/Users/tanaike/apache-tomcat-7.0.39/lib/*"
#export CLASSPATH="$CLASSPATH:/Users/tanaike/apache-tomcat-7.0.39/webapps/BookButlerEngine/WebContent/WEB-INF/lib/*"

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

#export PATH=$PATH:/Applications/MAMP/htdocs/BHL_iteleworker/cake/console:/opt/local/bin
#export PATH=$PATH:/Users/tanaike/android-sdks/tools
#export PATH="$PATH":/Users/tanaike/Desktop/mySVN/mac/chromium/depot_tools
#export PATH="$PATH":/Users/yuki.tanaike/Library/Android/sdk/platform-tools
#export PATH="$PATH":/Users/yuki.tanaike/Library/Android/sdk/build-tools/29.0.2

#export PATH=$PATH:/usr/local/mecab/bin/
#export PATH=$PATH:/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/
#export PATH=$PATH:/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/cmd
#export PATH=$PATH:/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/bin
#export TREETAGGER_HOME=/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/
#set show-all-if-ambiguous on
#export PATH=$PATH:/Users/tanaike/android-sdks/platform-tools/

export PATH=$PATH:$HOME/pear/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi

#export GOOGLE_APPLICATION_CREDENTIALS="/Users/yuki.tanaike/GCP/UserApp-Prod-f1c66041519c.json"

export PATH=$PATH:.
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH=$PATH:$HOME/.nodebrew/current/bin
export PATH=$PATH:$HOME/flutter/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
