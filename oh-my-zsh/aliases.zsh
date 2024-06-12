# source aliases
#
if [ -f $HOME/.aliases ]; then
   . $HOME/.aliases
fi

alias ll='ls -lFh'
alias sa='alias | fzf'
alias se='printenv | fzf'
alias s=sudo
alias svi='sudo vim'
alias apt='sudo apt'
alias p='ping6'
alias q='exit'
alias tf='tail -f'
alias tt='telnet'
alias stowth='stow --dotfiles --verbose --stow --target ~/'
alias unstowth='stow --dotfiles --verbose --delete --target ~/'

# shutdown
#
alias reboot='sudo shutdown -r now'
alias halt='sudo shutdown -h now'

alias yrc='vim ~/.config/yabai/yabairc'
alias src='vim ~/.config/skhd/skhdrc'
alias zrc='vim ~/.zshrc'
