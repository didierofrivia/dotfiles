#!/bin/sh

fancy_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\n$fmt\n" "$@"
}

append_to_zshrc() {
  local text="$1" zshrc
  local skip_new_line="${2:-0}"

  if [ -w "$HOME/.zshrc.local" ]; then
    zshrc="$HOME/.zshrc.local"
  else
    zshrc="$HOME/.zshrc"
  fi

  if ! grep -Fqs "$text" "$zshrc"; then
    if [ "$skip_new_line" -eq 1 ]; then
      printf "%s\n" "$text" >> "$zshrc"
    else
      printf "\n%s\n" "$text" >> "$zshrc"
    fi
  fi
}

fancy_echo "OHAI! Let's setup your mac, shall we?"

cat << "EOF"
          )            (
         /(   (\___/)  )\  _____________
        ( #)  \ (- -) ( # |        '\\\\\\
         ||___c\   >'__|  |        ' ____|_
         ||**** )`_/ **'  |   +    '||::::::
   .__   |'* ___| |___*'  |        '||_____|
    \_|  |'*(    ~   ,)'  \'_______|_____|
      )) |' /(.  '  .)\   ___/____|___\___
     (( _""";!___*_____\_|    _    '  <<<:|
       /     /|          |_________'___o_o|
      /_____/ /
      |:____|/  "Boy, I love this stuff".

EOF

# Install Homebrew
fancy_echo "Installing Homebrew..."
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Rosetta for M1 Macs
if [[ $(uname -m) == 'arm64' ]]; then
  sudo softwareupdate -install-rosetta --agree-to-license
fi


# Update recipes
brew update

# Install deps with bundle (listed in Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
fancy_echo "Setting Zsh as default..."
chsh -s $(which zsh)

# Set macOS preferences, originally from https://github.com/mathiasbynens/dotfiles
# fancy_echo "Set macOS preferences ..."
# source .macos

# Install Oh-My-Zsh
fancy_echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
