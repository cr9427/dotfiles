# set LS_COLORS for GNU ls
if [ ~/.dircolors ]; then
  eval "$(dircolors ~/.dircolors)"
else
  eval "$(dircolors)"
fi

unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1
export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS'

# use same colouring for completions, but also specify magenta for hidden files
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} '=.*=35'
