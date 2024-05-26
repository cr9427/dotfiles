#!/bin/sh
#
mkdir -p $HOME/work/GitHub
git clone https://github.com/cr9427/dotfiles.git $HOME/work/GitHub/dotfiles

export KEEP_ZSHRC=yes
export CHSH=no
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd $HOME/work/GitHub/dotfiles/stow
stow --dotfiles --verbose --stow --target ~/ *
