#! /bin/sh
#
# tweak the boost installation so that coral can link against it.
#
set -x
PKGINSTALL_DIR=$1
if [ -z "$PKGINSTALL_DIR" ]; then
    echo "$0: Installation directory not provided on command line"
    exit 2
fi
VERSION=$2
if [ -z "$VERSION" ]; then
    echo "$0: Package version not provided on command line"
    exit 2
fi

BUILDDIR=$PWD
INSTALL_DIR=$PKGINSTALL_DIR/$VERSION
BOOST_LIB=$INSTALL_DIR/lib

for lib in *.dylib
do
    install_name_tool -id $BOOST_LIB/$lib $lib
done

