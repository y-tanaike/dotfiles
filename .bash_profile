source ~/.tcshrc

export JAVA_HOME="$(/usr/libexec/java_home)"
export CLASSPATH="$CLASSPATH:/Users/tanaike/apache-tomcat-7.0.39/lib/*"
export CLASSPATH="$CLASSPATH:/Users/tanaike/apache-tomcat-7.0.39/webapps/BookButlerEngine/WebContent/WEB-INF/lib/*"

alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

export PATH=$PATH:/Applications/MAMP/htdocs/BHL_iteleworker/cake/console:/opt/local/bin
export PATH=$PATH:/Users/tanaike/android-sdks/tools
export PATH="$PATH":/Users/tanaike/Desktop/mySVN/mac/chromium/depot_tools

export PATH=$PATH:/usr/local/mecab/bin/
export PATH=$PATH:/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/
export PATH=$PATH:/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/cmd
export PATH=$PATH:/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/bin
export TREETAGGER_HOME=/Applications/MAMP/htdocs/JpnEngNews/simple_engine/treetagger/
set show-all-if-ambiguous on
export PATH=$PATH:/Users/tanaike/android-sdks/platform-tools/

export PATH=$PATH:/Users/tanaike/pear/bin

export PATH=$PATH:.
