# determine OS
#
if [ -x $HOME/bin/config.guess ]; then
   OS=`$HOME/bin/config.guess`
fi
echo ""
if [ x$OS = x ]; then
        echo "OS    is not detectable ... update $HOME/bin/config.guess"
else
        echo "OS    is $OS"
        export OS
fi

# determine HOME
#
echo  "home  is $HOME"

# determine SHELL
#
echo "shell is $SHELL"
echo
