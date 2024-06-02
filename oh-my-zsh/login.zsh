# set hostname to $HOST
#
echo ""

export HOST=`hostname -s`
echo "HOST:    $HOST"

export arch_name="$(uname -m)"
echo "ARCH:    $arch_name"

# determine OS
#
if [ -x $HOME/bin/config.guess ]; then
   OS=`$HOME/bin/config.guess`
fi
if [ x$OS = x ]; then
        echo "OS:      not detectable ... update $HOME/bin/config.guess"
else
        echo "OS:      $OS"
        export OS
fi

# determine HOME
#
echo  "home:    $HOME"

# determine SHELL
#
echo "shell:   $SHELL"
echo

export EDITOR=vim

# Nicer prompt.
# export PS1=$'\n'"%F{green} %*%F %3~ %F{white}"$'\n'"$ "
PS1=$'%{\e[0;33m%}%n@%{\e[0;33m%}%B%m%b%{\e[0;33m%}[%{\e[0m%}%~%{\e[0;33m%}]%{\e[0;33m%}%(!.#.>)%{\e[0m%} '
RPS1=$'%{\e[0;33m%}(%{\e[0m%}%?%{\e[0;33m%})%T%{\e[0m%}'
export PS1 RPS1
