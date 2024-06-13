if [ ! -d $HOME/.cache ]; then
  mkdir $HOME/.cache
fi

HISTFILE=~/.cache/zhistory.`hostname -s`
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first
setopt hist_verify

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
