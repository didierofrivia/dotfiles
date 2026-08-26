#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up Fedora..."

echo "Installing DNF packages..."
sudo dnf install -y $(grep -v '^#' "$SCRIPT_DIR/dnf.txt" | tr '\n' ' ')

echo "Installing Flatpak apps..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
while IFS= read -r app; do
  [ -n "$app" ] && flatpak install -y flathub "$app" || true
done < "$SCRIPT_DIR/flatpaks.txt"

echo "Installing Starship..."
if ! command -v starship >/dev/null 2>&1; then
  curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "Installing Rust..."
if ! command -v rustup >/dev/null 2>&1; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

echo "Installing NVM..."
if [ ! -d "$HOME/.nvm" ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash
fi

echo "Installing GVM..."
if [ ! -d "$HOME/.gvm" ]; then
  curl -fsSL gvm.run/install.sh | bash
fi

echo "Installing lazydocker..."
if ! command -v lazydocker >/dev/null 2>&1; then
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
fi

echo "Fedora setup complete."
