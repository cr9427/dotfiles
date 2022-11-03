#!/bin/sh
#
# $Id: bcp.sh 131 2013-03-05 09:14:41Z holm $
#
# make a backup copy of a file
# bcp filename
#
if [ x$1 = x ]; then
  echo
  echo "  Usage: bcp filename"
  echo
  exit 1
fi

if [ ! -e ${1}.`date +%F` ]; then
   cp -a ${1} ${1}.`date +%F`
else
  for i in `seq 2 999`; do
    if [ ! -e ${1}.`date +%F`_${i} ]; then
      cp -a ${1} ${1}.`date +%F`_${i}
      exit 0
    fi
  done
fi
