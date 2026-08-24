#!/bin/sh
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux)
      if [ -f /etc/fedora-release ]; then
        echo "fedora"
      else
        echo "linux"
      fi
      ;;
    *) echo "unknown" ;;
  esac
}

OS="$(detect_os)"
echo "Detected OS: $OS"

if ! command -v stow >/dev/null 2>&1; then
  echo "Installing stow..."
  case "$OS" in
    macos)  brew install stow ;;
    fedora) sudo dnf install -y stow ;;
    *)      echo "Please install GNU Stow manually."; exit 1 ;;
  esac
fi

echo "Stowing common packages..."
stow -d "$DOTFILES/common" -t "$HOME" git shell

case "$OS" in
  macos)
    echo "Stowing macOS packages..."
    stow -d "$DOTFILES/macos" -t "$HOME" vim zsh
    echo "Running macOS setup..."
    sh "$DOTFILES/macos/install.sh"
    ;;
  fedora)
    echo "Stowing Fedora packages..."
    stow -d "$DOTFILES/fedora" -t "$HOME" bash starship alacritty
    echo "Running Fedora setup..."
    sh "$DOTFILES/fedora/setup.sh"
    ;;
esac

echo "Done!"
