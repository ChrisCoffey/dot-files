############ 
#
#  Config Variables
#
###########
ulimit -n 4096

alias ..="cd .."
alias ...=".. && .."
alias ....=".. && ..." 
alias ll="ls -al"
alias ws="cd ~/workspace"
alias wsl="cd ~/workspace/leaf"
alias wsp="cd ~/workspace/personal"
alias wso="cd ~/workspace/open_source"
alias wsc="cd ~/workspace/consulting"
alias wsrk="cd ~/workspace/consulting/rk"
alias wspr="cd ~/workspace/proxy"
alias wsr="cd ~/workspace/roundtown"
alias wsi="cd ~/workspace/consulting/inmoji"
alias wscv="cd ~/workspace/college_vine"
alias wsv="cd ~/.config/nvim/plugged"
alias 3p="cd ~/3rdParty"
alias sbt13="~/3rdParty/sbt_13.5/bin/sbt"
alias play="~/3rdParty/play-2.2.3/play"
alias activator="~/3rdParty/activator-1.2.3-minimal/activator"
alias clearsbt='export SBT_OPTS=""'
alias sparkNotebook='(~/bin/spark-notebook-0.6.1-scala-2.10.4-spark-1.5.0-hadoop-2.2.0/bin/spark-notebook)'
alias sghci="stack ghci"
alias sghc="stack ghc"
alias shapeless="~/bin/bootScripts/shapeless.sh"
alias fs2="~/bin/bootScripts/fs2.sh"
alias szs="~/bin/bootScripts/scalazS.sh"
alias genny="/Applications/Genymotion\ Shell.app/Contents/MacOS/gennyshell"


alias startpsql=' postgres -D /Users/ccoffey/bin/pgData/'

export WS="/Users/ccoffey/workspace"
export SCALA_HOME="/Users/ccoffey/bin/scala_current"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_05)
export JAVA_OPTIONS="-Xms64m -Xmx4G -Xss2m -XX:MaxPermSize=2G"
export SBT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"
export GEM_HOME=/usr/local/bin/ruby/2.0.0/gems

export PATH=$PATH:$SCALA_HOME
export PATH=$PATH:$SCALA_HOME/bin
export PATH=$PATH:/Users/ccoffey/bin
export PATH=$PATH:/Users/ccoffey/.local/bin
export PATH=$PATH:/Users/ccoffey/bin/bootScripts/git
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/Users/ccoffey/bin/s3cmd-1.5.0-rc1
export PATH=~/anaconda/bin:$PATH
export PATH=~/bin/spark-1.2.1-bin-hadoop2.4/bin:$PATH
export PATH=~/3rdParty/phantomjs/bin/:$PATH
export PATH=$GEM_HOME:$PATH

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
########################
### Boot2Docker Settings
########################

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ccoffey/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

########################

source ~/bin/bootScripts/git/gitFuncs.sh
source ~/bin/bootScripts/mongo.sh
source ~/bin/bootScripts/roundtown.sh
source ~/bin/bootScripts/proxy.sh
source ~/bin/bootScripts/contract.sh
source ~/bin/bootScripts/cv.sh
