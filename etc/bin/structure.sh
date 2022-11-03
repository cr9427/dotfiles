#!/bin/sh +x
#
# $Id: structure.sh 131 2013-03-05 09:14:41Z holm $
#
# make my HOMEDIR structue to support different OSs
#

LIST_DIR=$HOME/run/etc
x_OS=`config.guess`

home_bin () {
	echo "make home-binary structrure in $1/$2"
   
	        if [ ! -d $1/$2 ]; then
		  mkdir -p $1/$2
	       fi
	
		for i in `cat $3/workosbase-tree`; do
			mkdir -p $1/$i
		done
		for i in `cat $3/workosdir-tree`; do
			mkdir -p $1/$2/$i
		done

		func_os_struct () {
		   for a in $1; do 
		      cd $a
		      for i in man info include share; do
		      	 if [ ! -d ../$i ]; then
		   	    mkdir ../$i
		   	    ln -s ../$i $i 
			 else
			    ln -s ../$i $i
		      	 fi
		      done
		   done
		}
		func_os_struct $1/$2
	echo "done ....."
}

case "$1" in
   home-bin|homebin|run|staff|bin|tmp|test|tet)
	 home_bin $1 $x_OS $LIST_DIR
	 ;;
      *)
	 echo "usage: $0 [BASE_DIR]"
	 ;;
esac
