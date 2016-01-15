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
alias wspr="cd ~/workspace/proxy"
alias wsr="cd ~/workspace/roundtown"
alias wsi="cd ~/workspace/consulting/inmoji"
alias 3p="cd ~/3rdParty"
alias sbt13="~/3rdParty/sbt_13.5/bin/sbt"
alias play="~/3rdParty/play-2.2.3/play"
alias activator="~/3rdParty/activator-1.2.3-minimal/activator"
alias clearsbt='export SBT_OPTS=""'
alias sparkNotebook='(~/bin/spark-notebook-0.6.1-scala-2.10.4-spark-1.5.0-hadoop-2.2.0/bin/spark-notebook)'
alias sghci="stack ghci"
alias sghc="stack ghc"

#############
#
# Git Stuff
#
##############

# https://github.com/mfitzp/martinfitzpatrick.name/blob/master/content/computing/add-git-branch-name-to-terminal-prompt-mac.md
parse_git_branch() {

      git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'

    }

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

function gwl(){
  Command="git branch --merged master | grep -v master " 
  
  if [ "$1" == "d" ]; then
    Command+="| xargs -I % sh -c 'git branch -D %; git push origin --delete %;'"
  fi;
 
  eval "$Command && git fetch --prune origin"
}

if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

alias gc="git checkout"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gp="git pull"

##############


alias startpsql=' postgres -D /Users/ccoffey/bin/pgData/'

export WS="/Users/ccoffey/workspace"
export SCALA_HOME="/Users/ccoffey/bin/scala_current"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_05)
export JAVA_OPTIONS="-Xms64m -Xmx4G -Xss2m -XX:MaxPermSize=2G"
export SBT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

export PATH=$PATH:$SCALA_HOME:/Users/ccoffey/bin
export PATH=$PATH:/usr/local/bin:$SCALA_HOME/bin:/Users/ccoffey/bin/s3cmd-1.5.0-rc1
export PATH=~/anaconda/bin:$PATH
export PATH=~/bin/spark-1.2.1-bin-hadoop2.4/bin:$PATH
export PATH=~/3rdParty/phantomjs/bin/:$PATH

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
########################
### Boot2Docker Settings
########################

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ccoffey/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

########################

source ~/bin/bootScripts/export.awsKeys.sh
source ~/bin/bootScripts/mongo.sh
source ~/bin/bootScripts/roundtown.sh
source ~/bin/bootScripts/proxy.sh
