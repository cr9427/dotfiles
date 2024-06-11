export ZSH_COMPDUMP=$HOME/.cache/zcompdump.`hostname -s`

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
autoload -Uz compinit && compinit

# Case insensitive.
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# completion menus will look very nice
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

