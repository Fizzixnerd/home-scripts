#! /bin/bash

# Set exit status, output error to stderr
# if any, output "done! (n errors)" to stdout.
#
# exit with 0 if no errors; exit with 1 if errors.

nerr=0
exit_status=0

# rm the remnants of any past tests.

rm -R temp*

# Make a folder, create a file containing little text, copy file, run del_dups
# on it.  Check if only one file remains.  Del folder if successful, leave if not.

mkdir temp1
cd temp1
echo "test text" > file1
cp file1 file2
del_dups
cd ..

if [ `ls temp1` != file1 ]; then
    exit_status=1
    nerr=`expr $nerr + 1`
    echo "failed first test" >&2
else
    del temp1
fi

#