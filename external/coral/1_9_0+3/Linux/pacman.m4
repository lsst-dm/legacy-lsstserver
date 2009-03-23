#
#   coral 1_9_0+3 Linux
#
m4_changequote([, ])m4_dnl
#
m4_define([m4_PACKAGE], [coral])m4_dnl
m4_define([m4_VERSION], [1_9_0+3])m4_dnl
m4_define([m4_FLAVOR], [Linux])m4_dnl
m4_define([m4_PKGPATH], [external/m4_PACKAGE/m4_VERSION/m4_FLAVOR])
m4_define([m4_ABOUTURL], [http://dev.lsstcorp.org/])m4_dnl
m4_define([m4_TARBALL], [coral-1_9_0+3-linux.tar.gz])m4_dnl
# 
# set up the initial pacman definitions and environment variables.
#
m4_include([PacmanExt-pre.m4])m4_dnl
# freeMegsMinimum(11)       # requires at least 11 Megs to build and install

#
# denote dependencies
#
# package('LSST:otherpkg-version')


#
# begin installation assuming we are located in LSST_HOME
#
# available environment variables:
#   LSST_HOME           the root of the LSST installation (the current 
#                          directory)
#   THIRDPARTY_INSTALL  the directory where 3rd party packages are installed
#   THIRDPARTY_BUILD    the temporary directory where 3rd party packages 
#                          are built
#
# EUPS_PATH and EUPS_FLAVOR should also be set.
#


cd('$THIRDPARTY_BUILD')

#
#   download any tarballs and unzip
#
echo ("downloading and extracting m4_PACKAGE-m4_VERSION (m4_FLAVOR)...")
downloadUntar('m4_PKGURL/m4_PKGPATH/m4_TARBALL','BUILDDIR')

#
#   cd into the untarred directory, configure, make and make install
#
#cd('$BUILDDIR')
#echo ("configuring m4_PACKAGE-m4_VERSION...")
#shell('./configure --prefix=$THIRDPARTY_INSTALL/m4_PACKAGE/m4_VERSION')
#echo ("running make")
#shell('make')
#echo ("running make install")
#shell('make install')

shell('mkdir -p $THIRDPARTY_INSTALL/m4_PACKAGE')
shell('mkdir -p $THIRDPARTY_INSTALL/m4_PACKAGE/m4_VERSION')
shell('mv $BUILDDIR/m4_VERSION-linux/* $THIRDPARTY_INSTALL/m4_PACKAGE/m4_VERSION')

#
# Now download & install the EUPS table file and load package into EUPS
#
m4_include([PacmanExt-post.m4])m4_dnl

uninstallShell('rm -rf $PWD/external/m4_PACKAGE/m4_VERSION')
uninstallShell('rmdir $PWD/external/m4_PACKAGE; true')



