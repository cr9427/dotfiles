#!/bin/sh
#
# $Id: expire.sh 131 2013-03-05 09:14:41Z holm $
#
# remove to old files
#
expire () {
   if [ -d $1 ]; then
      age=`echo $2 | sed -e 's/.\([0-9]*\)/\1/'`
      echo "processing $1 ..."
      echo -n "   `du -sh $1 | awk '{print $1}'` bytes in "
      echo "   `find $1 -type f | wc -l | awk '{print $1}'` files"
      echo "   deleting files older then $age days"
      find $1 -type f -mtime $2 -exec rm -f -- {} \;
      echo -n "   `du -sh $1 | awk '{print $1}'` bytes in "
      echo "   `find $1 -type f | wc -l | awk '{print $1}'` files"
      echo ""
   else
      echo "directory $1 dosen't exist"
      echo ""
   fi
}


echo \
"### expiring old files ##################################"

expire $HOME/.cvsup/log				+30
