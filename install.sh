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
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update recipes
brew update

# Install deps with bundle (listed in Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
fancy_echo "Setting Zsh as default..."
chsh -s $(which zsh)

# Install Oh-My-Zsh
fancy_echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install yarn globally
fancy_echo "Installing Yarn globally and jspm..."
npm install -g yarn jspm

fancy_echo "Configuring Ruby ..."
find_latest_ruby() {
  rbenv install -l | grep -v - | tail -1 | sed -e 's/^ *//'
}

ruby_version="$(find_latest_ruby)"
# shellcheck disable=SC2016
append_to_zshrc 'eval "$(rbenv init - --no-rehash)"' 1
eval "$(rbenv init -)"

if ! rbenv versions | grep -Fq "$ruby_version"; then
  RUBY_CONFIGURE_OPTS=--with-openssl-dir=/usr/local/opt/openssl rbenv install -s "$ruby_version"
fi

rbenv global "$ruby_version"
rbenv shell "$ruby_version"
gem update --system
gem_install_or_update 'bundler'
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

# Install rmagick and capybara-webkit
gem install rmagick -v '2.15.3'
gem install capybara-webkit

# Install lunchy gem
gem install lunchy

# Lunchy redis and mysql detection
ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents

# Set macOS preferences, originally from https://github.com/mathiasbynens/dotfiles
fancy_echo "Set macOS preferences ..."
source .macos
