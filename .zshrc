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
plugins=(git git-extras github npm autojump)

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

# AutoJump
[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# lunchy
LUNCHY_DIR=$(dirname `gem which lunchy`)/../extras
if [ -f $LUNCHY_DIR/lunchy-completion.zsh ]; then
  . $LUNCHY_DIR/lunchy-completion.zsh
fi

# heroku
export PATH="/usr/local/heroku/bin:$PATH"

# execute local node modules bin
export PATH="$(npm bin):/Users/dd/.npm-packages/bin/:$PATH"
alias npm-exec='PATH=$(npm bin):$PATH'
alias karma='npm-exec karma'
alias poi='npm-exec poi'
alias sao='npm-exec sao'
alias flow='npm-exec flow'
alias eslint='npm-exec eslint'
alias jest='npm-exec jest'
alias jspm='npm-exec jspm'

# Autocomplete fish-like zsh plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

#eval "$(ssh-agent -s)"
#ssh-add -k ~/.ssh/id_rsa
