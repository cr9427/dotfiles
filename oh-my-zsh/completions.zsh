# if we are on Ubuntu with zsh installed
if [ -d  /usr/share/zsh/vendor-completions ]; then
  fpath=(/usr/share/zsh/vendor-completions $fpath)
fi

# if zsh-completions ist installed with brew
if [ -d $HOMEBREW_PREFIX/share/zsh-completions ]; then
  fpath=($HOMEBREW_PREFIX/share/zsh-completions $fpath)
fi

# Setup a custom completions directory
fpath=($ZSH_CUSTOM/completions $fpath)

# Enable the completion system
autoload compinit

# Initialize all completions on $fpath and ignore (-i) all insecure files and directories
compinit -i
