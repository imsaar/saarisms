if [[ -s "$HOME/.rvm/scripts/rvm" ]]  ; then source "$HOME/.rvm/scripts/rvm" ; fi

#export PS1='$\[\e[1;32m\]\w\[\e[m\] \[\e[0;31m\]\$ \[\e[m\]\[\e[0;37m\]\n^ '


function _update_ps1()
{
  export PS1="$(~/powerline-bash.py $?)"
}
export PROMPT_COMMAND="_update_ps1"
export TERM=xterm-256color

##
# Your previous /Users/ali/.profile file was backed up as /Users/ali/.profile.macports-saved_2010-07-11_at_16:32:36
##

# Add PostgresSQL to path
export PATH=/Library/PostgreSQL/8.4/bin:$PATH

# Add mongodb to path
export PATH=/apps/mongodb/bin:$PATH

# Add todo.txt config
export TODOTXT_DEFAULT_ACTION=ls
export PATH=$PATH:/Volumes/Data\ Drive/Dropbox/Everywhere/todo_txt
alias to='todo -d /Volumes/Data\ Drive/Dropbox/Everywhere/todo_txt/todo.cfg'
source /Volumes/Data\ Drive/Dropbox/Everywhere/todo_txt/todo_completion

set -o vi

# Add MySQL to path
export PATH=$PATH:/usr/local/mysql/bin
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/

# add usr/local before in the path
export PATH=/usr/local/bin:$PATH

# add /opt/bin after tmux install
export PATH=$PATH:/opt/bin

# Initialization for FDK command line tools.Fri Sep 28 09:45:04 2012
FDK_EXE="/Users/ali/bin/FDK/Tools/osx"
PATH=${PATH}:"/Users/ali/bin/FDK/Tools/osx"
export PATH
export FDK_EXE

# for grails
export JAVA_HOME=/Library/Java/Home
export PATH="$PATH:$JAVA_HOME/bin"
export GRAILS_HOME=/apps/grails
export PATH="$PATH:$GRAILS_HOME/bin"
source ~/.aliases

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
