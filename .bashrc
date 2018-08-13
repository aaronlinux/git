export PS1="\[\e[32;1m\]\u@\h \W$\[\e[0m\]"
alias em="emacs -nw"
alias gitrn="git add .&& git commit -m "m"&& git push"
alias apt-get="cyg-get"
alias df='df -h'
alias du='du -h'
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
alias ls='ls -h --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #
alias wch='which -a'
if
    [ $(uname) == "CYGWIN_NT-10.0" ];then
    export PS1="\[\e[32;1m\]\u@cygwin \W$\[\e[0m\]"
    alias apt-get="apt-cyg"
elif
    [ $(uname) == "CYGWIN_NT-6.1" ];then
    export PS1="\[\e[32;1m\]\u@cygwin \W$\[\e[0m\]"
    alias apt-get="apt-cyg"
elif
    [ $(uname) == "Linux" ];then    
    export PS1="\[\e[32;1m\]Liusong@linux \W$\[\e[0m\]"
    alias apt-get="apt-cyg"
elif
    [ $(uname) == "Darwin" ];then
    export PS1="\[\e[32;1m\]\u@Mac-Pro-Liusong \W$\[\e[0m\]"


fi
