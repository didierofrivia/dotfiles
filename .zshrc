# dotfiles path
export DOTFILES=$HOME/dotfiles

# oh-my-zsh path
export ZSH=$HOME/.oh-my-zsh

# oh-my-zsh theme
ZSH_THEME="pygmalion"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$DOTFILES

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras github npm autojump zsh-autosuggestions)

# Activate Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# eval "$(ssh-agent -s)"
# ssh-add -k ~/.ssh/id_rsa

# AutoJump
[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh

# rbenv
# export PATH="$HOME/.rbenv/bin:$PATH"
 eval "$(rbenv init -)"

# heroku
export PATH="/usr/local/heroku/bin:$PATH"

# execute local node modules bin
export PATH="$(npm bin):/Users/dd/.npm-packages/bin/:$PATH"
alias npm-exec='PATH=$(npm bin):$PATH'

# LSD https://github.com/Peltoche/lsd
alias ls='lsd'
alias lh= 'ls -lah'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# OPENSSL
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# 3scale Porta
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
#export APICAST_REGISTRY_URL=https://apicast-staging.proda.3sca.net/policies
export APICAST_REGISTRY_URL=http://policies.apicast.io/latest/policies.json
export UNICORN_WORKERS=8
export RAILS_LOG_TO_STDOUT=1

alias railss='bundle exec rails s -b 0.0.0.0'

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 11)

# Apicurio
alias apicurio='./distro/quickstart/target/apicurio-studio-*-SNAPSHOT/bin/standalone.sh -c standalone-apicurio.xml'

# K8s
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
alias k="kubectl"

# Go
export PATH="$HOME/go/bin:$PATH"
