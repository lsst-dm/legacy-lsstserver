#!/bin/bash
#
# this script should be run from the $BOOST_DIR directory
#
#set -x
set -e

cd lib
libs=`ls libboost_thread-gcc*-mt*`
ver=`echo $libs | sed -e 's/ .*$//' -e 's/^.*-gcc//' -e 's/-.*$//'`
for lib in $libs; do
    need=`echo $lib | sed -e "s/gcc$ver/gcc/"`
    if [ ! -e $need ]; then
        ln -s $lib $need
    fi
done




