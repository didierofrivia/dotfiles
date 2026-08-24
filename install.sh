#!/bin/sh
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"
STOW_PACKAGES="git vim shell zsh"

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
cd "$DOTFILES"
for pkg in $STOW_PACKAGES; do
  echo "  -> $pkg"
  stow -t "$HOME" "$pkg"
done

case "$OS" in
  macos)
    echo "Running macOS setup..."
    sh "$DOTFILES/macos/install.sh"
    ;;
  fedora)
    echo "Running Fedora setup..."
    sh "$DOTFILES/fedora/setup.sh"
    ;;
esac

echo "Done!"
