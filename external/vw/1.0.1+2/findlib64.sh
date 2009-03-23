#! /bin/bash
#
set -x
set -e

test -n "$VW_DIR"
lib64=$VW_DIR/lib64
mkdir -p $lib64/{lib,include}

for filename in $*; do
  if (echo $filename | grep -q '\.h'); then
    # look in /usr/include
    path=/usr/include/$filename
    if [ ! -f "$path" ]; then
	echo "Can't find $filename in /usr/include"
	exit 1
    fi

    [ -e "$lib64/include/$filename" ] || ln -s $path $lib64/include/$filename

  else 
    path=/usr/lib64/lib$filename
    libpaths=`ls $path.* 2> /dev/null`
    if [ -z "$libpaths" ]; then
	echo "Can't find $filename in /usr/lib64"
	exit 1
    fi

    for path in $libpaths; do 
	libfile=`echo $path | sed -e 's/^.*\///'`
	[ -e "$lib64/lib/$libfile" ] || ln -s $path $lib64/lib/$libfile
    done
  fi
done
