#!/bin/bash

sudo apt update
sudo apt -y install ssh vim curl screen yarn nodejs

# Install nvim
pushd .
cd ~/workspace

# download nvim and install
wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim-linux64.tar.gz
tar -zxvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
export PATH=$PATH:$HOME/workspace/nvim-linux64/bin
git config --global core.editor nvim
alias vi='nvim'
alias vim='nvim'

# download Go and install

wget https://golang.org/dl/go1.15.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.3.linux-amd64.tar.gz
export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin

popd

# Plug for nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# copy vimrc setup
mkdir -p ~/.vim
cp .vimrc ~/
cp .screenrc ~/

# create sym link for nvim to use
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

cp coc-settings.json ~/.vim/

# Install plug-in
nvim +PlugInstall -c q
nvim +GoInstallBinaries  -c q
echo "Go Binaries Installed"
ls -la $GOBIN

