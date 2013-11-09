#! /bin/bash

# Set exit status, output error to stderr
# if any, output "done! (n errors)" to stdout.
#
# exit with 0 if no errors; exit with 1 if errors.

nerr=0
exit_status=0

# Test to see if it prints a single-word prompt to stdout correctly when fed
# it from stdin.

test_string="hello"
if [ `echo "$test_string" | rawinput` = "$test_string" ]; then
    true
else
    echo "actual output was the following:" >&2
    echo `echo "$test_string" | rawinput` >&2
    nerr=`expr $nerr + 1`
    exit_status=1
    echo "test one failed!" >&2
fi

# Test to see if it prints a multiple-word sentence prompt to stdout correctly
# when fed it from stdin.

test_string="The dog jumped over the fence."
if [ "`echo "$test_string" | rawinput`" = "$test_string" ]; then
    true
else
    echo "actual output was the following:" >&2
    echo `echo "$test_string" | rawinput` >&2
    nerr=`expr $nerr + 1`
    exit_Status=1
    echo "test two failed!" >&2
fi

# print to stderr the number of errors and exit with $exit_status

echo "There were $nerr error(s)." >&2
exit $exit_status