export PS1="\[\e[32;1m\]\u@\h \W$\[\e[0m\]"
alias em="emacs -nw"
alias gitrn="git add .&& git commit -m "m"&& git push"
alias apt-get="cyg-get"
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
