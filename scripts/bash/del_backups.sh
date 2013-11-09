#! /bin/bash

# This program will trash backups of files (those ending in ~ or #) in the
# specified directories.  If they are not directories, I don't know what will
# happen.

#optstring=i
#
#parsed_options=`getopt -- $optstring "$@"`
#
#for option in $parsed_options; do
#    case $option in

if [ "$#" -gt 0 ]; then
    original_directory=pwd
    dirs="$@"
    for directory in $dirs; do
	if [ -d $diectory ]; then
	    cd $directory
	    del_backups
	else
	    echo "$directory is not a directory." >&2
	fi
	cd $original_directory
    done
else
    regbackup=`echo *~`
    crashbackup=`echo *#`
    if [ $regbackup != '*~' ]; then
	del $regbackup; fi
    if [ $crashbackup != '*#' ]; then
	del $crashbackup; fi
fi

exit $?