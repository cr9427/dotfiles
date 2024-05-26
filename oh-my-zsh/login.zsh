# set hostname to $HOST
#
echo ""
export HOST=`hostname -s`
echo "HOST:    $HOST"

# determine OS
#
if [ -x $HOME/bin/config.guess ]; then
   OS=`$HOME/bin/config.guess`
fi
if [ x$OS = x ]; then
        echo "OS:      not detectable ... update $HOME/bin/config.guess"
else
        echo "OS       $OS"
        export OS
fi

# determine HOME
#
echo  "home:    $HOME"

# determine SHELL
#
echo "shell:   $SHELL"
echo
