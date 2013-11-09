#! /bin/bash

# Set exit status, output error to stderr
# if any, output "done! (n errors)" to stdout.
#
# exit with 0 if no errors; exit with 1 if errors.

nerr=0
exit_status=0
TRASH=~/.local/share/Trash/files

# rm the remnants of any past tests.

rm -R temp*

# make a file named temp0 containing sample text.  del it.  Check trash for
# existence.

echo test >temp0
del temp0
if [ -x $TRASH/temp0 ]; then
    true
else
    nerr=`expr $nerr + 1`
    exit_status=1
    echo "test zero failed!" >&2

# make a directory named temp1, a file named file1 with sample text.  del first
# the file, then the directory.  Check to make sure they both exist in the
# trash folder.

mkdir temp1
echo "random text" >temp1/file1
del temp1/file1
del temp1
if [ -x $TRASH/file1 ] && [ -d $TRASH/temp1/]; then
    true
else
    nerr=`expr $nerr + 1`
    exit_status=1
    echo "test one failed!" >&2
fi

# make a directory named temp2, make a file named file2 inside it.  del the
# directory.  Check to see if they are in the trash folder, preserving the
# directory tree structure.

mkdir temp2
echo "random text" >temp2/file2
del temp2
if [ -d $TRASH/temp2 ] && [ -x $TRASH/temp2/file2 ]; then
    true
else
    nerr=`expr $nerr + 1`
    exit_status=1
    echo "test two failed!" >&2
fi

# print to stderr the number of errors and exit with $exit_status

echo "There were $nerr error(s)." >&2
exit $exit_status