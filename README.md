# dd's dotfiles

Dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/), supporting macOS and Fedora.

## Structure

```
dotfiles/
├── git/          # .gitconfig, .gitignore_global, .gitmessage
├── vim/          # .vimrc
├── shell/        # .inputrc, .editorconfig
├── zsh/          # .zshrc, .aliases
├── macos/        # Brewfile, .macos, .mackup.cfg, themes/
├── fedora/       # dnf.txt, setup.sh
└── install.sh    # Cross-platform bootstrap
```

## Installation

### Quick start

```bash
cd ~
git clone https://github.com/didierofrivia/dotfiles.git
cd dotfiles
./install.sh
```

The install script detects your OS, installs Stow if needed, stows all common packages, and runs the platform-specific setup.

### Manual stow

```bash
cd ~/dotfiles
stow -t ~ git vim shell zsh
```

To remove a package: `stow -D -t ~ <package>`

### macOS prerequisites

1. Install Xcode Command Line Tools: `xcode-select --install`
2. Install [Homebrew](https://brew.sh)

### Fedora

```bash
cd ~/dotfiles
./fedora/setup.sh   # installs base packages from dnf.txt
stow -t ~ git vim shell zsh
```

## Acknowledgements

Big shout to all the devs listed on [GitHub does dotfiles](https://dotfiles.github.io/), especially [Mathias Bynens](https://github.com/mathiasbynens).

## Feedback

Suggestions welcome! Open an [issue](https://github.com/didierofrivia/dotfiles/issues/new).
