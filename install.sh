#!/bin/sh

echo "Setting up your machine..."

# Check for Oh My Zsh and install if we don't have it
if test ! "$(which omz)"; then
  echo "Installing OhMyZsh..."
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Removes a bunch of dotfiles from $HOME (if they exists) and symlinks the same file from the .dotfiles
DOTFILES=(.tmux.conf .vimrc .zshrc)

for dotfile in ${DOTFILES[@]};
  do
    ([ -f $dotfile ] || [ -L $dotfile ]) && rm $HOME/$dotfile

    ln -s $dotfile $HOME/$dotfile
  done

# Setup NVIM
NVIM_PATH=/usr/local/bin/nvim
NVIM_CONFIG_PATH=$HOME/.config/nvim

if [ ! -f $NVIM_PATH ]; then
  echo "Installing NeoVim..."
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o $NVIM_PATH
  chmod u+x $NVIM_PATH
fi

if [ ! -d $NVIM_CONFIG_PATH ]; then
  echo "Pulling NvChad configs..."
  git clone https://github.com/NvChad/NvChad $NVIM_CONFIG_PATH --depth 1
fi
