alias ..="cd .."
alias ...=".. && .."
alias ....=".. && ..." 
alias ll="ls -al"
alias ws="cd ~/workspace"
alias wsl="cd ~/workspace/leaf"
alias wsp="cd ~/workspace/personal"
alias wso="cd ~/workspace/open_source"
alias 3p="cd ~/3rdParty"
alias sbt13="~/3rdParty/sbt_13.5/bin/sbt"
alias play="~/3rdParty/play-2.2.3/play"
alias activator="~/3rdParty/activator-1.2.3-minimal/activator"
alias clearsbt='export SBT_OPTS=""'

export WS="/Users/ccoffey/workspace"
export SCALA_HOME="/Users/ccoffey/bin/scala_current"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0_05)
export FRAPS="$WS/fraps"
export JAVA_OPTIONS="-Xms64m -Xmx4G -Xss2m -XX:MaxPermSize=2G"
export SBT_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9999"

export PATH=$PATH:$SCALA_HOME:/Users/ccoffey/bin
export PATH=$PATH:/usr/local/bin:$SCALA_HOME/bin:/Users/ccoffey/bin/s3cmd-1.5.0-rc1
export PATH="$HOME/Library/Haskell/bin:$PATH"

########################
### Boot2Docker Settings
########################

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/ccoffey/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

########################


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi
