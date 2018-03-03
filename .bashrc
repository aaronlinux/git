export PS1="\[\e[32;1m\]\u@\h \W$\[\e[0m\]"
alias em="emacs"
alias apt-get="apt-cyg"
alias gitrn="git add .&& git commit -m "m"&& git push"
if
  [[ $(expr substr $(uname) 1 3) == "CYG" ]];then
    export PS1="\[\e[32;1m\]\u@cygwin \W$\[\e[0m\]"
fi
