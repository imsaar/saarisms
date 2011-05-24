if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi

export PS1='$\[\e[1;32m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;37m\]\n>> '

alias cls=clear
alias r=rails
alias ll='ls -al'
alias zf='/usr/local/zend/share/ZendFramework/bin/zf.sh'

set -o vi
##
# Your previous /Users/ali/.profile file was backed up as /Users/ali/.profile.macports-saved_2010-07-11_at_16:32:36
##

# MacPorts Installer addition on 2010-07-11_at_16:32:36: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

export GROOVY_HOME=/apps/groovy-1.7.5

# Disney Specific
export P4CONFIG=~/.p4config
export M2_HOME=/apps/prod/apache-maven-2.2.1
export ANT_HOME=/apps/prod/apache-ant-1.7.1
export JAVA_HOME=/apps/prod/jdk1.6
export PATH=$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$GROOVY_HOME/bin:$PATH
export MAVEN_OPTS=-Xmx1024m

##
# Your previous /Users/arizvi/.profile file was backed up as /Users/arizvi/.profile.macports-saved_2011-01-11_at_14:59:49
##

# MacPorts Installer addition on 2011-01-11_at_14:59:49: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/usr/local/zend/share/ZendFramework/bin:$PATH
export PATH=/usr/local/zend/bin:$PATH

# DCL Porthole specific
alias mem="memcached -m 1 -l 127.0.0.1 -p 11211 -d"
# End DCL Porthole specifi
