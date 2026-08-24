alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias g="git"
alias h="history"
alias j="jobs"
alias v="nvim"

alias l="ls -lF --color=auto"
alias la="ls -laF --color=auto"
alias lsd="ls -lF --color=auto | grep --color=never '^d'"
alias ls="ls --color=auto"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias sudo="sudo "

alias ip="curl -s ifconfig.me"
alias localip="hostname -I | awk '{print \$1}'"
alias sniff="sudo ngrep -d 'any' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i any -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

alias gci="git pull --rebase && git push"

alias k="kubectl"

alias dc="docker compose"
alias lzd="lazydocker"
