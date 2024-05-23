# determine OS
#
if [ -x $HOME/bin/config.guess ]; then
   _OS=`$HOME/bin/config.guess`
fi
echo ""
if [ x$_OS = x ]; then
        echo "OS    is not detectable ... update $HOME/bin/config.guess"
else
        echo "OS    is $_OS"
fi

# determine HOME
#
echo  "home  is $HOME"

# determine SHELL
#
echo "shell is $SHELL"
echo
