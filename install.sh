#!/bin/sh

echo "OHAI! Let's setup your mac, shall we?"

cat << "EOF"
                      .-.
                     (   )
                      '-'
                      J L
                      | |
                     J   L
                     |   |
                    J     L
                  .-'.___.'-.
                 /___________\
            _.-""'           `bmw._
          .'                       `.
        J                            `.
       F                               L
      J                                 J
     J                                  `
     |                                   L
     |                                   |
     |                                   |
     |                                   J
     |                                    L
     |                                    |
     |             ,.___          ___....--._
     |           ,'     `""""""""'           `-._
     |          J           _____________________`-.
     |         F         .-'   `-88888-'    `Y8888b.`.
     |         |       .'         `P'         `88888b \
     |         |      J       #     L      #    q8888b L
     |         |      |             |           )8888D )
     |         J      \             J           d8888P P
     |          L      `.         .b.         ,88888P /
     |           `.      `-.___,o88888o.___,o88888P'.'
     |             `-.__________________________..-'
     |                                    |
     |         .-----.........____________J
     |       .' |       |      |       |
     |      J---|-----..|...___|_______|
     |      |   |       |      |       |
     |      Y---|-----..|...___|_______|
     |       `. |       |      |       |
     |         `'-------:....__|______.J
     |                                  |
      L___                              |
          """----...______________....--'

EOF

# Install Homebrew
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update recipes
brew update

# Install deps with bundle (listed in Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which zsh)

# Install yarn globally
npm install --global yarn

# Set macOS preferences, originally from https://github.com/mathiasbynens/dotfiles
source .macos
