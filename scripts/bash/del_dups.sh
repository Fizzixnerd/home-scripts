#! /bin/bash

# This does it recursively by default.  Uses cmp for comparisons.  Assumes that
# its ARGVs are folders.  Dunno what will happen if they aren't.
if [ "$#" -gt 0 ]; then
    for folder in "$@"; do
	if [ -d $folder ]; then
	    for subfile in `ls -1 $folder`; do
		if [ -d $subfile ]; then
		    del_dups ${folder}${subfile}
		else
		    for other_subfile in `ls -1 $folder`; do
			if cmp ${folder}${other_subfile} ${folder}${subfile}; then
			    if [ $other_subfile != $subfile ]; then
				del ${folder}${subfile}
			    fi
			fi
		    done
		fi
	    done
	fi
    done
else
    del_dups ./
fi
