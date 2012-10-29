PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

function _update_ps1()
{
     export PS1="$(~/powerline-bash.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
