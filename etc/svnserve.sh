#!/bin/sh
#
# To Install:
#  1.  mv /usr/bin/svnserve /usr/bin/svnserve_bin
#  2.  copy this file to /usr/bin/svnserve
#  
# Note that if subversion is updated, this custom script will likely 
# get overwritten; thus, it will be necessary to replace it
#
umask 002
/usr/bin/svnserve_bin -r /lsst/repos "$@"
