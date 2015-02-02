function killport {
    if [ ! -n "$1" ] || [ $1 == '--help' ] || [ $1 == '-h' ]
    then
        echo '`killport <PORT>` finds the process listening to the specified port and kills it.'
    else
        process_line=`sudo lsof -i :$1 | tail -1`
        if [ "$process_line" == "" ]
        then
            echo "no processes listening on $1"
        else
            process_name=`echo "$process_line" | awk '{print $1}'`
            echo "killing $process_name"
            sudo kill `echo "$process_line" | awk '{print $2}'`
        fi
    fi
}

# easier to type on dvorak:
alias i='ls -F' # 'i' like inventory
alias ch=cd # CHange directory

alias reload="source ~/.bash_profile && reset"

# for git branch in prompt
source ~/dotfiles/git_prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
# for git branch tab-completion
source ~/dotfiles/git_completion.sh

# check this page for colors: http://misc.flogisoft.com/bash/tip_colors_and_formatting
# TODO: show git status
PS1='\[\e[90m\]\t \[\e[94m\]\w \[\e[0m\]$(__git_ps1 "(%s)")\$ '

PATH=~/dotfiles/bin:$PATH
