export DOTFILES="$HOME/dotfiles"

export EDITOR="nvim"
export VISUAL="nvim"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend

shopt -s checkwinsize
shopt -s globstar

if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

if [ -f "$HOME/.bash_aliases" ]; then
  . "$HOME/.bash_aliases"
fi

# Custom bin for trying software
export PATH="$HOME/bin:$PATH"
export PATH="$HOME.bin:$PATH"

# fzf
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --bash)"
fi

# zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init bash)"
fi

# Starship prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init bash)"
fi

# Rust
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# GVM (Go Version Manager)
if [ -x "$HOME/bin/gvm" ]; then
    eval "$(gvm env)"
fi

# Local overrides
[ -f "$HOME/.bashrc.local" ] && . "$HOME/.bashrc.local"
