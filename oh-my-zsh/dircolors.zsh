# set LS_COLORS for GNU ls
if [ ~/.dircolors ]; then
  eval "$(dircolors ~/.dircolors)"
else
  eval "$(dircolors)"
fi

# use same colouring for completions, but also specify magenta for hidden files
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} '=.*=35'
