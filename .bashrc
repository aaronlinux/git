export PS1="\[\e[32;1m\]\u@\h \W$\[\e[0m\]"
alias em="emacs"
alias apt-get="apt-cyg"
alias gitrn="git add .&& git commit -m "m"&& git push"
if
    [ $(uname) == "CYGWIN_NT-10.0" ];then
    export PS1="\[\e[32;1m\]\u@cygwin \W$\[\e[0m\]"
fi
