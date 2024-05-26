if [ ! -d $HOME/.history ]; then
  mkdir $HOME/.history
fi

HISTFILE=~/.history/`hostname -s`
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY
