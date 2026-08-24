# dd's dotfiles

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/), supporting macOS and Fedora.

## Structure

```
dotfiles/
├── common/                # stowed on both platforms
│   ├── git/               #   .gitconfig, .gitignore_global, .gitmessage
│   └── shell/             #   .inputrc, .editorconfig
├── macos/                 # macOS only
│   ├── vim/               #   .vimrc
│   ├── zsh/               #   .zshrc, .aliases
│   ├── Brewfile
│   ├── install.sh
│   └── themes/
├── fedora/                # Fedora only
│   ├── bash/              #   .bashrc, .bash_aliases
│   ├── starship/          #   .config/starship.toml
│   ├── alacritty/         #   .config/alacritty/alacritty.toml
│   ├── dnf.txt
│   ├── flatpaks.txt
│   └── setup.sh
└── install.sh             # Cross-platform bootstrap
```

## Installation

### Quick start

```bash
cd ~
git clone https://github.com/didierofrivia/dotfiles.git
cd dotfiles
./install.sh
```

The install script detects your OS, installs Stow, stows the right packages, and runs platform-specific setup.

### Manual stow

```bash
# Common
stow -d common -t ~ git shell

# macOS
stow -d macos -t ~ vim zsh

# Fedora
stow -d fedora -t ~ bash starship alacritty
```

To remove a package: `stow -D -d <dir> -t ~ <package>`

## Acknowledgements

Big shout to all the devs listed on [GitHub does dotfiles](https://dotfiles.github.io/), especially [Mathias Bynens](https://github.com/mathiasbynens).

## Feedback

Suggestions welcome! Open an [issue](https://github.com/didierofrivia/dotfiles/issues/new).
