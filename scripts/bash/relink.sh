#! /bin/bash

# relink the scripts in your script root folder, which you can supply
# if you want, or it will just use ~/System/scripts.  Don't end it
# with a /, or shit might go wrong.

if [ "$#" -gt 0 ]; then
    script_folder=$1
else
    script_folder=~/.system/scripts
fi

for linkname in `ls -1 ~/.system/bin/`; do
    ~/.system/scripts/del.py $linkname
done

for subscript_folder in `ls -1 ${script_folder}`; do
    ./del_backups.sh ${script_folder}/${subscript_folder}/
    for filename in `ls -1 ${script_folder}/${subscript_folder}`; do
	ln -sfT ${script_folder}/${subscript_folder}/${filename} ~/System/bin/${filename%.*}
    done
done

exit 0
